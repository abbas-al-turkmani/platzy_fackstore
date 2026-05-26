import 'package:flutter/material.dart';

import 'package:platzy_fackstore/core/dependency_injection/service_locator.dart';
import 'package:platzy_fackstore/core/theme_management/extensions/any_page_theme/any_page_theme.dart';
import 'package:platzy_fackstore/core/utils/responsive_utils.dart';

import '../../gen/fonts.gen.dart';
import 'extensions/button1_theme/button1_theme.dart';
import 'extensions/button2_theme/button2_theme.dart';
import 'extensions/my_card_theme/my_card_theme.dart';
import 'extensions/my_navigation_bar_theme/my_navigation_bar_theme.dart';

class WhiteTheme {
  static ThemeData themeData(BuildContext context) {
    ResponsiveUtils utils = getItInstance();

    return ThemeData.light().copyWith(
      // Scaffold Theme
      scaffoldBackgroundColor: const Color(0x001d182a),
      iconTheme: const IconThemeData(color: Colors.white),

      // Primary Text Theme
      primaryTextTheme: TextTheme(
        // Headlines
        headlineLarge: TextStyle(
          fontFamily: FontFamily.circularStd,
          fontWeight: FontWeight.w700,
          fontSize: utils.getResponsiveFontSize(context, 32),
          color: Colors.white,
        ),
        headlineMedium: TextStyle(
          fontFamily: FontFamily.circularStd,
          fontWeight: FontWeight.w700,
          fontSize: utils.getResponsiveFontSize(context, 24),
          color: Colors.white,
        ),
        headlineSmall: const TextStyle(),

        // Body
        bodyLarge: TextStyle(
          fontFamily: FontFamily.circularStd,
          fontWeight: FontWeight.w500,
          fontSize: utils.getResponsiveFontSize(context, 24),
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          fontFamily: FontFamily.circularStd,
          fontWeight: FontWeight.w400,
          fontSize: utils.getResponsiveFontSize(context, 16),
          color: Colors.white,
        ),
      ),

      // Button themes
      // Button1
      buttonTheme: const ButtonThemeData(),

      // Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0x008e6cef),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          textStyle: TextStyle(
            fontFamily: FontFamily.circularStd,
            fontSize: utils.getResponsiveFontSize(context, 16),
            color: Colors.white,
          ),
        ),
      ),

      // Text Button
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontFamily: FontFamily.circularStd,
          fontWeight: FontWeight.w500,
          fontSize: utils.getResponsiveFontSize(context, 16),
          color: Colors.white,
        ),
      )),

      // Icon Button
      iconButtonTheme: const IconButtonThemeData(),

      // Toggle Buttons
      toggleButtonsTheme: const ToggleButtonsThemeData(),

      // Extensions
      extensions: [
        // Theme for all pages
        AnyPageTheme(
          background: const Color(0xFF1D182A),
          headerText1: Colors.white,
          primaryText1: Colors.white,
          secoundryText1: Colors.grey,
        ),

        // Navigation Bar
        MyNavigationBarTheme(
          backgroundColor: const Color(0x001d182a),
          navigationBarIcon: const Color(0x7CFFFFFF),
          navigationBarIconActive: const Color(0x008e6cef),
        ),

        // cards
        MyCardTheme(
          cardColor: const Color(0x00342f3f),
          textLarge: TextStyle(
            fontFamily: FontFamily.circularStd,
            fontWeight: FontWeight.w500,
            fontSize: utils.getResponsiveFontSize(context, 16),
            color: Colors.white,
          ),
          textMedium: TextStyle(
            fontFamily: FontFamily.circularStd,
            fontWeight: FontWeight.w400,
            fontSize: utils.getResponsiveFontSize(context, 16),
            color: Colors.white,
          ),
          iconColor: Colors.white,
        ),

        // Buttons
        Button1Theme(
          backgroundColor: const Color(0x00342f3f),
          textColor: Colors.white,
          iconColor: Colors.white,
        ),
        Button2Theme(
          backgroundColor: const Color(0x008e6cef),
          textColor: Colors.white,
          iconColor: Colors.white,
        ),
      ],
    );
  }
}
