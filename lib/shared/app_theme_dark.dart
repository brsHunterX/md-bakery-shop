import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bakery_shop/shared/app_theme_colors.dart';

class AppThemeDark {
  AppThemeDark._();

  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme),
    colorScheme: const ColorScheme.dark().copyWith(
      brightness: Brightness.dark,
      primary: Color(0xffffb870),
      onPrimary: Color(0xff4b2800),
      primaryContainer: Color(0xff6c3b00),
      onPrimaryContainer: Color(0xffffdcbc),
      secondary: Color(0xffe2c0a4),
      onSecondary: Color(0xff412c18),
      secondaryContainer: Color(0xff59422d),
      onSecondaryContainer: Color(0xffffdcbf),
      tertiary: Color(0xffbfcd88),
      onTertiary: Color(0xff2a3400),
      tertiaryContainer: Color(0xff404c14),
      onTertiaryContainer: Color(0xffdbe9a1),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffb4ab),
      background: Color(0xff201a16),
      onBackground: Color(0xffece0d9),
      surface: Color(0xff201a16),
      onSurface: Color(0xffece0d9),
      surfaceVariant: Color(0xff51453a),
      onSurfaceVariant: Color(0xffd5c4b6),
      outline: Color(0xff9e8e81),
      inverseSurface: Color(0xffece0d9),
      onInverseSurface: Color(0xff352f2b),
      inversePrimary: Color(0xff89510d),
      primaryVariant: Color(0xffffb870),
      secondaryVariant: Color(0xffe2c0a4),
      surfaceTint: Color(0xffffb870)
    ),
  );
}
