import 'package:flutter/material.dart';

import '../common/common.dart';
import '../theme/theme.dart';
import 'material_state.dart';

/// кнопка с фоном
class KElevatedButton extends ElevatedButton {
  KElevatedButton.medium({
    super.key,
    VoidCallback? onPressed,
    required Widget label,
    Widget? icon,
  }) : super(
          style: _mediumStyle,
          onPressed: onPressed,
          child: _createCustomButtonChild(label, icon),
        );
  KElevatedButton.mediumSecondary({
    super.key,
    VoidCallback? onPressed,
    required Widget label,
    Widget? icon,
  }) : super(
          style: _mediumSecondaryStyle,
          onPressed: onPressed,
          child: _createCustomButtonChild(label, icon),
        );
  KElevatedButton.mediumIcon({
    super.key,
    VoidCallback? onPressed,
    required Widget icon,
  }) : super(
          style: _mediumIconStyle,
          onPressed: onPressed,
          child: icon,
        );
  KElevatedButton.mediumIconSecondary({
    super.key,
    VoidCallback? onPressed,
    required Widget icon,
  }) : super(
          style: _mediumIconSecondaryStyle,
          onPressed: onPressed,
          child: icon,
        );
  KElevatedButton.normal({
    super.key,
    VoidCallback? onPressed,
    required Widget label,
    Widget? icon,
  }) : super(
          style: _normalStyle,
          onPressed: onPressed,
          child: _createCustomButtonChild(label, icon),
        );
  KElevatedButton.normalInversed({
    super.key,
    VoidCallback? onPressed,
    required Widget label,
    Widget? icon,
  }) : super(
          style: _normalInversedStyle,
          onPressed: onPressed,
          child: _createCustomButtonChild(label, icon),
        );
  KElevatedButton.small({
    super.key,
    VoidCallback? onPressed,
    required Widget label,
    Widget? icon,
  }) : super(
          style: _smallStyle,
          onPressed: onPressed,
          child: _createCustomButtonChild(label, icon),
        );

  static final _mediumStyle = _styleColorsElevated.merge(_styleShapeMedium);
  static final _mediumSecondaryStyle =
      _styleColorsElevatedSecondary.merge(_styleShapeMedium);
  static final _mediumIconStyle =
      _styleColorsElevated.merge(_styleShapeMediumIcon);
  static final _mediumIconSecondaryStyle =
      _styleColorsElevatedSecondary.merge(_styleShapeMediumIcon);

  static final _normalStyle = _styleColorsElevated.merge(_styleShapeNormal);
  static final _normalInversedStyle =
      _styleColorsElevatedInversed.merge(_styleShapeNormal);
  static final _smallStyle = _styleColorsElevated.merge(_styleShapeSmall);
}

/// прозрачная outlined-кнопка
class KOutlinedButton extends OutlinedButton {
  KOutlinedButton.medium({
    super.key,
    VoidCallback? onPressed,
    required Widget label,
    Widget? icon,
  }) : super(
          style: _mediumStyle,
          onPressed: onPressed,
          child: _createCustomButtonChild(label, icon),
        );
  KOutlinedButton.mediumSecondary({
    super.key,
    VoidCallback? onPressed,
    required Widget label,
    Widget? icon,
  }) : super(
          style: _mediumStyleSecondary,
          onPressed: onPressed,
          child: _createCustomButtonChild(label, icon),
        );
  KOutlinedButton.mediumError({
    super.key,
    VoidCallback? onPressed,
    required Widget label,
    Widget? icon,
  }) : super(
          style: _mediumErrorStyle,
          onPressed: onPressed,
          child: _createCustomButtonChild(label, icon),
        );
  KOutlinedButton.normal({
    super.key,
    VoidCallback? onPressed,
    required Widget label,
    Widget? icon,
  }) : super(
          style: _normalStyle,
          onPressed: onPressed,
          child: _createCustomButtonChild(label, icon),
        );
  KOutlinedButton.normalError({
    super.key,
    VoidCallback? onPressed,
    required Widget label,
    Widget? icon,
  }) : super(
          style: _normalErrorStyle,
          onPressed: onPressed,
          child: _createCustomButtonChild(label, icon),
        );
  KOutlinedButton.normalSecondary({
    super.key,
    VoidCallback? onPressed,
    required Widget label,
    Widget? icon,
  }) : super(
          style: _normalSecondaryStyle,
          onPressed: onPressed,
          child: _createCustomButtonChild(label, icon),
        );
  static final _mediumStyle = _styleColorsOutlined.merge(_styleShapeMedium);
  static final _mediumStyleSecondary =
      _styleColorsOutlinedSecondary.merge(_styleShapeMedium);
  static final _mediumErrorStyle =
      _styleColorsOutlinedError.merge(_styleShapeMedium);
  static final _normalStyle = _styleColorsOutlined.merge(_styleShapeNormal);
  static final _normalErrorStyle =
      _styleColorsOutlinedError.merge(_styleShapeNormal);
  static final _normalSecondaryStyle =
      _styleColorsOutlinedSecondary.merge(_styleShapeNormal);
}

const _styleShapeMedium = ButtonStyle(
  shape: MaterialStatePropertyAll<OutlinedBorder>(
    RoundedRectangleBorder(
      borderRadius: KBorderRadius.a8,
    ),
  ),
  minimumSize: MaterialStatePropertyAll<Size>(Size(64, 44)),
  padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(KEdgeInsets.h16v4),
);
const _styleShapeMediumIcon = ButtonStyle(
  shape: MaterialStatePropertyAll<OutlinedBorder>(CircleBorder()),
  fixedSize: MaterialStatePropertyAll<Size>(Size(44, 44)),
  padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(KEdgeInsets.a4),
);

const _styleShapeNormal = ButtonStyle(
  shape: MaterialStatePropertyAll<OutlinedBorder>(
    RoundedRectangleBorder(
      borderRadius: KBorderRadius.a30,
    ),
  ),
  minimumSize: MaterialStatePropertyAll<Size>(Size(64, 32)),
  padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
    KEdgeInsets.h12v4,
  ),
  textStyle: MaterialStatePropertyAll<TextStyle>(
    KTextStyle.buttonMedium,
  ),
);

const _styleShapeSmall = ButtonStyle(
  shape: MaterialStatePropertyAll<OutlinedBorder>(
    RoundedRectangleBorder(
      borderRadius: KBorderRadius.a16,
    ),
  ),
  minimumSize: MaterialStatePropertyAll<Size>(Size(64, 24)),
  padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
    KEdgeInsets.h8v2,
  ),
  textStyle: MaterialStatePropertyAll<TextStyle>(
    TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  ),
);

final _styleColorsElevated = ButtonStyle(
  backgroundColor: MaterialStatePropertyMapped<Color?>(
    kColorPrimary,
    {MaterialState.disabled: kColorPrimary.withOpacity(0.4)},
  ),
  foregroundColor: MaterialStatePropertyMapped<Color?>(
    kColorForeground,
    {MaterialState.disabled: kColorForeground.withOpacity(0.4)},
  ),
);
final _styleColorsElevatedSecondary = ButtonStyle(
  backgroundColor: MaterialStatePropertyMapped<Color?>(
    kColorSecondary,
    {MaterialState.disabled: kColorSecondary.withOpacity(0.4)},
  ),
  foregroundColor: MaterialStatePropertyMapped<Color?>(
    kColorForeground,
    {MaterialState.disabled: kColorForeground.withOpacity(0.4)},
  ),
);
final _styleColorsElevatedInversed = ButtonStyle(
  backgroundColor: MaterialStatePropertyMapped<Color?>(
    kColorForeground,
    {MaterialState.disabled: kColorForeground.withOpacity(0.4)},
  ),
  foregroundColor: MaterialStatePropertyMapped<Color?>(
    kColorText,
    {MaterialState.disabled: kColorText.withOpacity(0.4)},
  ),
);

final _styleColorsOutlined = OutlinedButton.styleFrom(
  foregroundColor: kColorPrimary,
  side: const BorderSide(color: kColorPrimary, width: 1),
);
final _styleColorsOutlinedSecondary = OutlinedButton.styleFrom(
  foregroundColor: kColorSecondary,
  side: const BorderSide(color: kColorSecondary, width: 1),
);
final _styleColorsOutlinedError = OutlinedButton.styleFrom(
  foregroundColor: kColorError,
  side: const BorderSide(color: kColorError, width: 1),
);

Widget _createCustomButtonChild(Widget label, Widget? icon) => icon == null
    ? label
    : Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          KSizedBox.w8,
          label,
        ],
      );
