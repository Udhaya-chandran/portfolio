import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF0A192F); // Deep Navy
  static const Color darkSecondary = Color(0xFF112240); // Lighter Navy
  static const Color darkAccent = Color(0xFF64FFDA); // Teal/Cyan
  static const Color darkText = Color(0xFFCCD6F6); // Off-white/Geay
  static const Color darkTextSecondary = Color(0xFF8892B0); // Muted Blue-Grey

  // Light Theme Colors
  static const Color lightBackground = Color(0xFFF0F4F8); // Soft Cloud Blue
  static const Color lightSecondary = Color(0xFFFFFFFF); // Pure White
  static const Color lightAccent = Color(0xFF2563EB); // Royal Blue
  static const Color lightText = Color(0xFF1E293B); // Slate 800
  static const Color lightTextSecondary = Color(0xFF64748B); // Slate 500

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightBackground,
    primaryColor: lightAccent,
    canvasColor: lightSecondary,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: lightText,
      displayColor: lightText,
    ).copyWith(
      displayLarge: GoogleFonts.poppins(
        fontSize: 56,
        fontWeight: FontWeight.bold,
        color: lightText,
        height: 1.1,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: lightText,
        height: 1.2,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: lightText,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        color: lightTextSecondary,
        height: 1.5,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: lightAccent,
      brightness: Brightness.light,
      surface: lightSecondary,
      onSurface: lightText,
      primary: lightAccent,
      secondary: lightTextSecondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightAccent,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBackground,
    primaryColor: darkAccent,
    canvasColor: darkSecondary,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: darkText,
      displayColor: darkText,
    ).copyWith(
      displayLarge: GoogleFonts.poppins(
        fontSize: 56,
        fontWeight: FontWeight.bold,
        color: darkText,
        height: 1.1,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: darkText,
        height: 1.2,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: darkText,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        color: darkTextSecondary,
        height: 1.5,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: darkAccent,
      brightness: Brightness.dark,
      surface: darkSecondary,
      onSurface: darkText,
      primary: darkAccent,
      secondary: darkTextSecondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: darkAccent,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: darkAccent),
        ),
        elevation: 0,
      ),
    ),
    iconTheme: const IconThemeData(color: darkAccent),
  );
}
