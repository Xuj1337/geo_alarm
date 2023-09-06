// Flutter imports:
import 'package:flutter/material.dart';
import 'package:geo_alarm_riverpod/core_ui/theme/shared.dart';

import '../common/edge_instets.dart';
import '../common/radius.dart';
import 'text_theme.dart';

ThemeData createTheme([BuildContext? context]) {
  var theme = ThemeData.light();
  theme = withCommons(theme);
  theme = withTextTheme(theme);
  theme = withButtonsTheme(theme);
  theme = withNavsTheme(theme);
  theme = withOthers(theme);
  return theme;
}

ThemeData withCommons(ThemeData theme) {
  return theme.copyWith(
    primaryColor: kColorPrimary,
    disabledColor: kColorDisabled,
    colorScheme: theme.colorScheme
        .copyWith(
          primary: kColorPrimary,
          onPrimary: kColorText,
          secondary: kColorSecondary,
          onSecondary: kColorForeground,
          background: kColorForeground,
          onBackground: kColorText,
          surface: kColorSurface,
          onSurface: kColorText,
          error: kColorError,
          onError: kColorText,
        )
        .copyWith(background: kColorForeground)
        .copyWith(error: kColorError),
  );
}

ThemeData withTextTheme(ThemeData theme) {
  final textTheme = theme.textTheme.copyWith(
    bodySmall: createTextStyle(
      theme.textTheme.bodySmall,
      fontSize: 12,
      lineHeight: 17,
      isMediumWeight: true,
    ),
    bodyMedium: createTextStyle(
      theme.textTheme.bodyMedium,
      fontSize: 14,
      lineHeight: 16,
    ),
    bodyLarge: createTextStyle(
      theme.textTheme.bodyLarge,
      fontSize: 16,
      lineHeight: 22,
    ),
    labelLarge: createTextStyle(
      theme.textTheme.labelLarge,
      fontSize: 14,
      lineHeight: 16,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: createTextStyle(theme.textTheme.titleLarge,
        fontSize: 18, lineHeight: 22, fontWeight: FontWeight.w600),
  );
  return theme.copyWith(
    textTheme: textTheme,
    iconTheme: theme.iconTheme.copyWith(
      color: kColorText,
    ),
  );
}

TextStyle createTextStyle(TextStyle? base,
        {required double fontSize,
        required double lineHeight,
        bool isMediumWeight = false,
        FontWeight? fontWeight}) =>
    (base ?? const TextStyle()).copyWith(
      fontFamily: 'Inter',
      fontSize: fontSize,
      fontWeight: isMediumWeight ? FontWeight.w500 : fontWeight,
      height: lineHeight / fontSize,
      leadingDistribution: TextLeadingDistribution.even,
      color: kColorText,
    );

ThemeData withButtonsTheme(ThemeData theme) {
  return theme.copyWith(
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        textStyle: const TextStyle(
          fontSize: 16,
          height: 19 / 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}

ThemeData withNavsTheme(ThemeData theme) {
  const navbarTextStyle = TextStyle(fontSize: 14);
  const navbarIconStyle = IconThemeData(size: 24);
  return theme.copyWith(
    scaffoldBackgroundColor: kColorForeground,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: kColorForeground,
      foregroundColor: kColorText,
      titleTextStyle: KTextStyle.headline6Medium,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kColorForeground,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: kColorPrimary,
      selectedLabelStyle: navbarTextStyle,
      selectedIconTheme: navbarIconStyle,
      unselectedItemColor: kColorSecondary,
      unselectedLabelStyle: navbarTextStyle,
      unselectedIconTheme: navbarIconStyle,
    ),
    tabBarTheme: theme.tabBarTheme.copyWith(
      labelStyle: KTextStyle.buttonMedium,
      labelPadding: KEdgeInsets.h16,
      labelColor: kColorPrimary,
      unselectedLabelStyle: KTextStyle.buttonMedium,
      unselectedLabelColor: kColorText,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(color: kColorPrimary, width: 1),
      ),
      indicatorSize: TabBarIndicatorSize.label,
    ),
  );
}

ThemeData withOthers(ThemeData theme) {
  return theme.copyWith(
    dividerTheme: const DividerThemeData(
      color: Color(0xFFE5F7FF),
      space: 32,
      thickness: 1,
    ),
    progressIndicatorTheme: theme.progressIndicatorTheme.copyWith(
      linearTrackColor: kColorForeground,
      color: kColorText,
      linearMinHeight: 4,
    ),
    snackBarTheme: theme.snackBarTheme.copyWith(
      backgroundColor: kColorText,
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: kColorSecondary),
        borderRadius: KBorderRadius.a8,
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: kColorSecondary),
        borderRadius: KBorderRadius.a8,
      ),
      errorMaxLines: 3,
      contentPadding: KEdgeInsets.a12,
      hintStyle: KTextStyle.body.secondaryColored,
    ),
    sliderTheme: const SliderThemeData(
      // thumb
      rangeThumbShape: RoundRangeSliderThumbShape(
        enabledThumbRadius: 12,
        elevation: 4,
        pressedElevation: 6,
      ),
      thumbColor: kColorForeground,
      overlayShape: RoundSliderOverlayShape(overlayRadius: 20),

      // track
      activeTrackColor: kColorPrimary,
      inactiveTrackColor: kColorSecondary,
      trackHeight: 2,

      // other
      showValueIndicator: ShowValueIndicator.never,
      rangeTickMarkShape: RoundRangeSliderTickMarkShape(tickMarkRadius: 0),
    ),
    chipTheme: theme.chipTheme.copyWith(
      backgroundColor: kColorForeground,
      selectedColor: kColorPrimary,
      shape: const RoundedRectangleBorder(borderRadius: KBorderRadius.a8),
      side: MaterialStateBorderSide.resolveWith((states) {
        if (!states.contains(MaterialState.selected)) {
          return const BorderSide(width: 1, color: kColorSecondary);
        } else {
          return const BorderSide(width: 1, color: kColorPrimary);
        }
      }),
    ),
  );
}
