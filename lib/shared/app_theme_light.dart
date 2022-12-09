import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeLight {
  AppThemeLight._();

  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: GoogleFonts.latoTextTheme(ThemeData.light().textTheme),
    colorScheme: const ColorScheme.light(
      primary: Color(0xff89510d),
      primaryContainer: Color(0xffffdcbc),
      onPrimaryContainer: Color(0xff2d1600),
      secondary: Color(0xff735943),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdcbf),
      onSecondaryContainer: Color(0xff291806),
      tertiary: Color(0xff57642a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffdbe9a1),
      onTertiaryContainer: Color(0xff171e00),
      error: Color(0xffba1a1a),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffffbfa),
      onBackground: Color(0xff201a16),
      surface: Color(0xfffffbfa),
      onSurface: Color(0xff201a16),
      surfaceVariant: Color(0xfff2dfd1),
      onSurfaceVariant: Color(0xff51453a),
      outline: Color(0xff827368),
      inverseSurface: Color(0xff352f2b),
      onInverseSurface: Color(0xfffaeee7),
      inversePrimary: Color.fromRGBO(255, 184, 112, 1),
      primaryVariant: Color(0xff89510d),
      secondaryVariant: Color(0xff735943),
      surfaceTint: Color(0xff89510d)
    ),
  );
}
