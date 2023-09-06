// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/common.dart';

// Project imports:

typedef KAsyncDataBuilder<T> = Widget Function(
  BuildContext context,
  T data,
);
typedef KAsyncLoadingBuilder = Widget Function(
  BuildContext context,
);
typedef KAsyncErrorBuilder = Widget Function(
  BuildContext context,
  Object error,
  StackTrace? stackTrace,
);

class KAsyncBuilder<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final KAsyncDataBuilder<T> builder;
  final KAsyncLoadingBuilder loadingBuilder;
  final KAsyncErrorBuilder errorBuilder;

  const KAsyncBuilder({
    Key? key,
    required this.value,
    required this.builder,
    KAsyncLoadingBuilder? loadingBuilder,
    KAsyncErrorBuilder? errorBuilder,
  })  : loadingBuilder = loadingBuilder ?? defaultLoadingBuilder,
        errorBuilder = errorBuilder ?? defaultErrorBuilder,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: (data) => builder(context, data),
      error: (error, stackTrace) => errorBuilder(context, error, stackTrace),
      loading: () => loadingBuilder(context),
    );
  }

  static Widget defaultLoadingBuilder(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  static Widget defaultErrorBuilder(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
  ) {
    return KSizedBox.shrink;
  }

  static Widget defaultErrorScaffoldBuilder(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
  ) {
    return Scaffold(
      body: defaultErrorBuilder(context, error, stackTrace),
    );
  }
}
