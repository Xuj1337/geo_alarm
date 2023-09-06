import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core_logic/core_logic.dart';

extension CacheExtension on AutoDisposeRef {
  KeepAliveLink cacheFor([Duration duration = const Duration(seconds: 3)]) {
    Timer? timer;
    final link = keepAlive();

    onCancel(() => timer = Timer(duration, link.close));
    onResume(() => timer?.cancel());
    onDispose(() => timer?.cancel());

    return link;
  }
}

extension DebounceExtension on Ref {
  Future<void> debounce([
    Duration duration = const Duration(milliseconds: 350),
  ]) {
    final completer = Completer<void>();
    final timer = Timer(duration, () {
      if (!completer.isCompleted) completer.complete();
    });
    onDispose(() {
      timer.cancel();
      if (!completer.isCompleted) {
        completer.completeError(StateError('Canceled'));
      }
    });
    return completer.future;
  }
}

/// для быстрого доступа к сервисам через ref в виджетах
extension WidgetRefExtension on WidgetRef {
  UtilsService get utilsService => read(utilsServiceProvider);
  NoticeService get noticeService => read(noticeServiceProvider);
}

/// для быстрого доступа к сервисам через ref в провайдерах
extension RefExtension on Ref {
  UtilsService get utilsService => read(utilsServiceProvider);
  NoticeService get noticeService => read(noticeServiceProvider);
}
