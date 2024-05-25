import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hajjiapp/core/utils/size_utils.dart';
import '../../core/app_export.dart';
import '../core/utils/pref_utils.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.primaryContainer.withOpacity(1),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.blueGray100,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 24,
        space: 24,
        color: appTheme.blueGray10002,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.black90001,
          fontSize: 16.fSize,
          fontFamily: 'JUST Sans',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.black90001,
          fontSize: 14.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.black90001,
          fontSize: 8.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: appTheme.black90001,
          fontSize: 47.fSize,
          fontFamily: 'JUST Sans',
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          color: appTheme.black90001,
          fontSize: 34.fSize,
          fontFamily: 'JUST Sans',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: colorScheme.primaryContainer.withOpacity(1),
          fontSize: 32.fSize,
          fontFamily: 'JUST Sans',
          fontWeight: FontWeight.w800,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 29.fSize,
          fontFamily: 'JUST Sans',
          fontWeight: FontWeight.w800,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.primaryContainer.withOpacity(1),
          fontSize: 24.fSize,
          fontFamily: 'JUST Sans',
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: appTheme.black90001,
          fontSize: 12.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        labelMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 10.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        labelSmall: TextStyle(
          color: colorScheme.primaryContainer.withOpacity(1),
          fontSize: 8.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: colorScheme.primaryContainer.withOpacity(1),
          fontSize: 21.fSize,
          fontFamily: 'JUST Sans',
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          color: appTheme.black90001,
          fontSize: 16.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: colorScheme.primary,
          fontSize: 14.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFFED2656),
    primaryContainer: Color(0X66FFFFFF),

    // Error colors
    onError: Color(0XFF6B6B6B),

    // On colors(text colors)
    onPrimary: Color(0XFF070D17),
    onPrimaryContainer: Color(0XFF232323),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Amber
  Color get amberA700 => Color(0XFFFFA800);

  // Black
  Color get black900 => Color(0XFF010003);
  Color get black90001 => Color(0XFF000000);

  // BlueGray
  Color get blueGray100 => Color(0XFFD2D2D2);
  Color get blueGray10001 => Color(0XFFD9D9D9);
  Color get blueGray10002 => Color(0XFFCFCFCF);
  Color get blueGray10003 => Color(0XFFD6D6D6);
  Color get blueGray400 => Color(0XFF898A8D);
  Color get blueGray50 => Color(0XFFF1F1F1);

  // Gray
  Color get gray100 => Color(0XFFF5F5F5);
  Color get gray200 => Color(0XFFE8E8E8);
  Color get gray20001 => Color(0XFFEAEAEA);
  Color get gray300 => Color(0XFFDBDBDB);
  Color get gray500 => Color(0XFFA0A0A0);
  Color get gray50001 => Color(0XFFA3A3A3);
  Color get gray50002 => Color(0XFF939393);
  Color get gray50003 => Color(0XFF999999);

  // Green
  Color get greenA700 => Color(0XFF00AE4F);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
