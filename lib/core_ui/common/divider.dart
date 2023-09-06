import 'package:flutter/material.dart';

import '../theme/shared.dart';

extension KDivider on Divider {
  static const _color = kColorTertiaryBlue;
  static const _thickness = 2.0;

  static const h48 = Divider(
    height: 48,
    thickness: _thickness,
    color: _color,
  );
  static const h32 = Divider(
    height: 32,
    thickness: _thickness,
    color: _color,
  );
  static const h40 = Divider(
    height: 40,
    thickness: _thickness,
    color: _color,
  );

  Divider withThickness(double width) => Divider(
        height: height,
        thickness: width,
        color: color,
      );
  Divider withColor(Color newColor) => Divider(
        height: height,
        thickness: thickness,
        color: newColor,
      );
}
