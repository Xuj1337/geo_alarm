// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geo_alarm_riverpod/core_logic/services/utils.dart';

import '../../core_ui/core_ui.dart';
import '../../navigation/router.dart';

/// Взаимодействие с UX (показ уведомлений/диалогов/выполнение асинхронной функции с автоматическим показом индикатора загрузки и выводом ошибок)
final noticeServiceProvider = Provider((ref) {
  return NoticeService(ref);
});

class NoticeService {
  final Ref _ref;
  late final UtilsService _utilsService;

  NoticeService(this._ref) {
    _utilsService = _ref.read(utilsServiceProvider);
  }

  /// вывод сообщения об ошибке
  void alertError(
    String? title, {
    String? message,
    VoidCallback? action,
  }) {
    KAlert.show(
      type: AlertType.error,
      msgState: _utilsService.msg,
      title: title,
      message: message,
      action: action,
    );
  }

  /// вывод предупреждения
  void alertWarning(
    String? title, {
    String? message,
    VoidCallback? action,
  }) {
    KAlert.show(
      type: AlertType.warning,
      msgState: _utilsService.msg,
      title: title,
      message: message,
      action: action,
    );
  }

  /// вывод предупреждения
  void alertSuccess(
    String? title, {
    String? message,
    VoidCallback? action,
  }) {
    KAlert.show(
      type: AlertType.success,
      msgState: _utilsService.msg,
      title: title,
      message: message,
      action: action,
    );
  }

  /// вывод информативного сообщения
  void alertInfo(
    String? title, {
    String? message,
    VoidCallback? action,
  }) {
    KAlert.show(
      type: AlertType.info,
      msgState: _utilsService.msg,
      title: title,
      message: message,
      action: action,
    );
    //  ScaffoldMessenger.of(_utilsService.ctx).showSnackBar(KAlert.info());
  }

  /// диалоговое окно подтверждения, возвращает [bool] в зависимости от ответа
  Future<bool?> confirm(String question) => _confirm(question, null);

  /// диалоговое предупредительное окно подтверждения, возвращает [bool] в зависимости от ответа
  Future<bool?> confirmError(String question) =>
      _confirm(question, kColorError);

  /// начать показ индикатора загрузки
  void startLoading([String? message]) {
    _utilsService.msg.context
        .findAncestorStateOfType<KLoadingState>()!
        .start(message);
  }

  /// завершить показ индикатора загрузки
  void endLoading() {
    _utilsService.msg.context.findAncestorStateOfType<KLoadingState>()!.end();
  }

  /// выводит ошибку
  void handleError(dynamic e) {
    if (e != null) {
      final message = _errorMessage(e) ?? e.toString();
      alertError(message);
    } else {
      alertError('Неизвестная ошибка');
    }
  }

  String? _errorMessage(dynamic e) {
    if (e is PlatformException) {
      return e.message;
    }
    return null;
  }

  /// делает вызов асинхронной функции с показом индикатора загрузки и возвращает результат,
  /// при выбросе исключения выводит сообщение с этой ошибки и делает rethrow,
  /// таким образом не нарушается изначальная логика
  Future<T> callNotifyingErrors<T>(
    Future<T> Function() asyncFn, [
    String? message,
    bool withLoading = true,
  ]) async {
    try {
      if (withLoading) startLoading(message);
      return await asyncFn();
    } on PlatformException catch (e) {
      inspect(e);
      rethrow;
    } catch (e) {
      handleError(e);
      rethrow;
    } finally {
      if (withLoading) endLoading();
    }
  }

  Future<T> callNotifyingWithoutLoadingErrors<T>(
    Future<T> Function() asyncFn, [
    String? message,
  ]) async {
    try {
      return await asyncFn();
    } on PlatformException catch (e) {
      inspect(e);
      rethrow;
    } catch (e) {
      handleError(e);
      rethrow;
    }
  }

  Future<bool?> _confirm(
    String question,
    Color? kColorText,
  ) {
    return showDialog<bool>(
      context: routerNavKey.currentContext ?? _utilsService.ctx,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: KBorderRadius.a4),
        title: const Text('Подтверждение'),
        content: Text(question),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop<bool>(false),
            child: const Text(
              'Отмена',
              style: TextStyle(color: kColorError),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop<bool>(true),
            child: Text(
              'ОК',
              style: TextStyle(color: kColorText),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> bottomModal(Widget child,
      {bool? isScrollControlled,
      bool isDismissible = true,
      bool enableDrag = true}) async {
    final ctx = routerNavKey.currentContext ?? _utilsService.ctx;
    await showModalBottomSheet(
        clipBehavior: Clip.hardEdge,
        isScrollControlled: isScrollControlled ?? false,
        isDismissible: isDismissible,
        backgroundColor: kColorForeground,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        enableDrag: enableDrag,
        context: ctx,
        builder: (_) => child);
  }

  Future<void> showPlatformModal(
    Widget child, {
    bool? isScrollControlled,
    bool isDismissible = true,
    bool enableDrag = true,
    EdgeInsets? contentPadding,
  }) async {
    await bottomModal(child,
        isScrollControlled: isScrollControlled,
        isDismissible: isDismissible,
        enableDrag: enableDrag);
  }
}
