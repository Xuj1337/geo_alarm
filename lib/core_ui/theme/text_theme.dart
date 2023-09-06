// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:

import 'shared.dart';

class KTextStyle extends TextStyle {
  static const headline6Semibold = KTextStyle.semibold(20, 24);
  static const headline6Medium = KTextStyle.medium(20, 24);
  static const titleMediumWide = KTextStyle.medium(18, 25);
  static const titleSemiboldWide = KTextStyle.semibold(18, 25);
  static const titleSemibold = KTextStyle.semibold(18, 22);
  static const titleMedium = KTextStyle.medium(18, 22);
  static const subtitleLeadingMedium = KTextStyle.medium(16, 22);
  static const subtitleLeadingSemibold = KTextStyle.semibold(16, 22);
  static const subtitleLeading = KTextStyle(16, 22);
  static const subtitleMedium = KTextStyle.medium(14, 17);
  static const subtitle = KTextStyle(14, 17);
  static const body = KTextStyle(14, 20);
  static const buttonMedium = KTextStyle.medium(14, 20);
  static const buttonSemibold = KTextStyle.semibold(14, 20);
  static const infoWide = KTextStyle(13, 23);
  static const infoMeduim = KTextStyle.medium(13, 16);
  static const info = KTextStyle(13, 16);
  static const captionMedium = KTextStyle.medium(12, 17);
  static const captionMediumDense = KTextStyle.medium(12, 14);
  static const captionSemiboldDense = KTextStyle.semibold(12, 14);
  static const caption = KTextStyle(12, 17);
  static const small = KTextStyle(10, 12);

  ///aditional desktop styles
  static const desktopBody = KTextStyle(20, 30);
  static const desktopCaption = KTextStyle(16, 20);

  static const desktopH5Semibold = KTextStyle.semibold(20, 24);
  static const desktopH5 = KTextStyle(20, 24);
  static const desktopH4Semibold = KTextStyle.semibold(24, 30);
  static const desktopH4 = KTextStyle(24, 30);
  static const desktopH3Semibold = KTextStyle.semibold(32, 38);
  static const desktopH3 = KTextStyle(32, 38);
  static const desktopH2Semibold = KTextStyle.semibold(40, 48);
  static const desktopH2 = KTextStyle.semibold(40, 48);
  static const desktopH1Semibold = KTextStyle.semibold(56, 67);
  static const desktopH1 = KTextStyle.semibold(56, 67);

  TextStyle get primaryColored => copyWith(color: kColorPrimary);
  TextStyle get secondaryColored => copyWith(color: kColorSecondary);
  TextStyle get secondaryTextColored => copyWith(color: kColorTextSecondary);
  TextStyle get foregroundColored => copyWith(color: kColorForeground);
  TextStyle get greyColored => copyWith(color: kColorGrey);
  TextStyle get errorColored => copyWith(color: kColorError);
  TextStyle withColor(Color color) => copyWith(color: color);

  const KTextStyle(
    double fontSize,
    double lineHeight, [
    FontWeight fontWeight = FontWeight.w400,
  ]) : super(
          fontSize: fontSize,
          height: lineHeight / fontSize,
          fontWeight: fontWeight,
          color: kColorText,
          fontFamily: kFontFamily,
          leadingDistribution: TextLeadingDistribution.even,
        );
  const KTextStyle.medium(
    double fontSize,
    double lineHeight,
  ) : super(
          fontSize: fontSize,
          height: lineHeight / fontSize,
          fontWeight: FontWeight.w500,
          color: kColorText,
          fontFamily: kFontFamily,
          leadingDistribution: TextLeadingDistribution.even,
        );
  const KTextStyle.semibold(
    double fontSize,
    double lineHeight,
  ) : super(
          fontSize: fontSize,
          height: lineHeight / fontSize,
          fontWeight: FontWeight.w600,
          color: kColorText,
          fontFamily: kFontFamily,
          leadingDistribution: TextLeadingDistribution.even,
        );
}

/// TODO создать класс KTextStyleVariants к-й группирует стили с одинаковым fontSize и предоставляет разные вариации (primary/semibold итд)
