import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

class AppThemes {
  /// App font family
  static final String _font = GoogleFonts.montserrat().fontFamily!;

  /// App dark color scheme
  static final ColorScheme darkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: AppColors.primary,
  );

  /// App light color scheme
  static final ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
  );

  /// App TextTheme
  static final TextTheme textTheme = TextTheme(
    displayLarge: AppTextStyle.title,
    displayMedium: AppTextStyle.subtitle,
    bodyLarge: AppTextStyle.body1,
    bodyMedium: AppTextStyle.body2,
    labelLarge: AppTextStyle.button,
    bodySmall: AppTextStyle.overline,
  );

  /// App light theme
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    fontFamily: _font,
    colorScheme: lightColorScheme,
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.primary,
      labelStyle: AppTextStyle.body2.copyWith(
        fontWeight: FontWeight.bold,
        fontFamily: _font,
      ),
      unselectedLabelStyle: AppTextStyle.body2.copyWith(
        fontWeight: FontWeight.bold,
        fontFamily: _font,
      ),
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: AppTextStyle.subtitle.copyWith(
        fontFamily: _font,
        fontWeight: FontWeight.w600,
        color: lightColorScheme.onBackground,
      ),
    ),
    iconTheme: IconThemeData(
      size: 20,
      color: lightColorScheme.onBackground,
    ),
    useMaterial3: true,
    textTheme: textTheme,
  );

  /// App dark theme
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    fontFamily: _font,
    useMaterial3: true,
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.primary,
      labelStyle: AppTextStyle.body2.copyWith(
        fontWeight: FontWeight.bold,
        fontFamily: _font,
      ),
      unselectedLabelStyle: AppTextStyle.body2.copyWith(
        fontWeight: FontWeight.bold,
        fontFamily: _font,
      ),
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: AppTextStyle.subtitle.copyWith(
        fontFamily: _font,
        color: darkColorScheme.onBackground,
        fontWeight: FontWeight.w600,
      ),
    ),
    iconTheme: IconThemeData(
      size: 20,
      color: darkColorScheme.onBackground,
    ),
    dividerTheme: const DividerThemeData(
      thickness: 1,
      color: Color(0xFF30323E),
    ),
    colorScheme: darkColorScheme,
    textTheme: textTheme,
  );
}
