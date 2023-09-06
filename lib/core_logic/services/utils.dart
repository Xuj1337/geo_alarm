// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// взаимодействие с навигатором (push/pop), получение всегда существующегося [BuildContext] итд
final utilsServiceProvider = Provider((ref) {
  return const UtilsService();
});

class UtilsService {
  const UtilsService();
  static const instance = UtilsService();

  // доступ к текущему навигатору
  // NavigatorState get nav => navStateKey.currentState!;

  /// доступ к текущему контексту
  BuildContext get ctx => msg.context;

  /// доступ к текущему к ScaffoldMessanger
  ScaffoldMessengerState get msg => messangerStateKey.currentState!;

  /// доступ к теме верхнего уровня,
  /// нужно учесть, что результат может отличаться от `Theme.of(context)`
  ThemeData get theme => Theme.of(ctx);

  /// глобальный текущий [BuildContext], чтобы избавиться от ошибок связанных с попытками доступа к disposed-контексту
  /// необходимо передавать конструктору [MaterialApp]
  /// https://stackoverflow.com/a/61773774/5245349
  static final navStateKey = GlobalKey<NavigatorState>();

  static final messangerStateKey = GlobalKey<ScaffoldMessengerState>();
}

extension NavigatorStateExtension on NavigatorState {
  Future<T?> pushBuilder<T extends Object?>(WidgetBuilder builder) => push<T>(
        MaterialPageRoute(
          builder: builder,
        ),
      );
}
