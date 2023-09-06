// Flutter imports:
import 'package:flutter/material.dart';

import '../common/common.dart';
import '../theme/theme.dart';

// Project imports:

enum AlertType { error, success, info, warning }

extension AlertTypeExt on AlertType {
  Widget get widget {
    const size = 25.0;

    var icon = Icons.done;
    var color = Colors.transparent;
    switch (this) {
      case AlertType.error:
        icon = Icons.error;
        color = kColorError;
        break;
      case AlertType.success:
        icon = Icons.done;
        color = kColorPrimary;

        break;
      case AlertType.info:
        icon = Icons.info;
        color = kColorSecondary;
        break;

      case AlertType.warning:
        icon = Icons.warning_rounded;
        color = kColorNotification;
        break;
    }
    return Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Icon(
        icon,
        size: size,
        color: kColorForeground,
      ),
    );
  }
}

class KAlert {
  static show({
    String? title,
    String? message,
    VoidCallback? action,
    required AlertType type,
    required ScaffoldMessengerState msgState,
  }) {
    final snackBar = SnackBar(
      margin: KEdgeInsets.a12,
      padding: KEdgeInsets.a12,
      action: SnackBarAction(
        label: action != null
            ? 'Перейти'
            : type != AlertType.warning
                ? '✕'
                : 'Ок',
        onPressed: action ?? () {},
        textColor: kColorSecondary,
      ),
      behavior: SnackBarBehavior.floating,
      shape: const RoundedRectangleBorder(borderRadius: KBorderRadius.a12),
      backgroundColor: kColorForeground,
      elevation: 8,
      content: Row(
        children: [
          type.widget,
          KSizedBox.w20,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null)
                  Text(
                    title,
                    style: KTextStyle.buttonSemibold,
                  ),
                if (message != null)
                  Text(
                    message,
                    style: KTextStyle.caption.withColor(kColorGrey),
                  )
              ],
            ),
          ),
        ],
      ),
    );
    msgState.showSnackBar(snackBar);
  }
}
