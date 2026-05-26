import 'package:platzy_fackstore/core/dependency_injection/service_locator.dart';
import 'package:flutter/material.dart';

import 'package:platzy_fackstore/gen/fonts.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/responsive_utils.dart';
import 'extensions/any_page_theme/any_page_theme.dart';
import 'extensions/button1_theme/button1_theme.dart';
import 'extensions/button2_theme/button2_theme.dart';
import 'extensions/my_card_theme/my_card_theme.dart';
import 'extensions/my_navigation_bar_theme/my_navigation_bar_theme.dart';
import 'extensions/my_text_field_theme/my_text_field_theme.dart';

class DarkTheme {
  static ThemeData themeData(BuildContext context) {
    ResponsiveUtils utils = getItInstance();

    return ThemeData.dark().copyWith(
      // Scaffold Theme
      scaffoldBackgroundColor: const Color(0xFF1d182a),
      iconTheme: const IconThemeData(color: Colors.white),

      // Primary Text Theme
      primaryTextTheme: TextTheme(
          // Headlines
          headlineLarge: TextStyle(
            fontFamily: FontFamily.circularStd,
            fontWeight: FontWeight.w700,
            // fontSize: utils.getResponsiveFontSize(context, 32),
            fontSize: 32.sp,
            color: Colors.white,
          ),
          headlineMedium: TextStyle(
            fontFamily: FontFamily.circularStd,
            fontWeight: FontWeight.w700,
            // fontSize: utils.getResponsiveFontSize(context, 24),
            fontSize: 24.sp,
            color: Colors.white,
          ),
          headlineSmall: TextStyle(
            fontFamily: FontFamily.gabarito,
            fontWeight: FontWeight.w700,
            // fontSize: utils.getResponsiveFontSize(context, 16),
            fontSize: 16.sp,
            color: Colors.white,
          ),

          // Body
          bodyLarge: TextStyle(
            fontFamily: FontFamily.circularStd,
            fontWeight: FontWeight.w500,
            // fontSize: utils.getResponsiveFontSize(context, 24),
            fontSize: 24.sp,
            color: Colors.white,
          ),
          bodySmall: TextStyle(
            fontFamily: FontFamily.circularStd,
            fontWeight: FontWeight.w400,
            // fontSize: utils.getResponsiveFontSize(context, 16),
            fontSize: 16.sp,
            color: Colors.white,
          ),

          // Title
          titleLarge: TextStyle(
            fontFamily: FontFamily.gabarito,
            fontWeight: FontWeight.w700,
            // fontSize: utils.getResponsiveFontSize(context, 32),
            fontSize: 32.sp,
            color: Colors.white,
          ),
          titleMedium: TextStyle(
            fontFamily: FontFamily.gabarito,
            fontWeight: FontWeight.w700,
            // fontSize: utils.getResponsiveFontSize(context, 32),
            fontSize: 16.sp,
            color: Colors.white,
          ),
          titleSmall: TextStyle(
            fontFamily: FontFamily.circularStd,
            fontWeight: FontWeight.w400,
            // fontSize: utils.getResponsiveFontSize(context, 12),
            fontSize: 12.sp,
            color: Colors.white,
          )),

      // Button themes
      // Button1
      buttonTheme: const ButtonThemeData(),

      // Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF8e6cef),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
          textStyle: TextStyle(
            fontFamily: FontFamily.circularStd,
            fontWeight: FontWeight.w500,
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
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: const Color(0x00342f3f),
          foregroundColor: Colors.white,
        ),
      ),

      // Toggle Buttons
      toggleButtonsTheme: ToggleButtonsThemeData(
        color: const Color(0xFF8e6cef),
        disabledColor: const Color(0xFF342f3f),
        disabledBorderColor: Colors.white,
        borderRadius: BorderRadius.circular(32),
        constraints: const BoxConstraints(minWidth: 100),
        textStyle: TextStyle(
          fontFamily: FontFamily.circularStd,
          fontWeight: FontWeight.w500,
          fontSize: utils.getResponsiveFontSize(context, 16),
          color: Colors.white,
        ),
      ),

      inputDecorationTheme: const InputDecorationTheme(),

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
          backgroundColor: const Color(0xFF1d182a),
          navigationBarIcon: const Color(0x7CFFFFFF),
          navigationBarIconActive: const Color(0xFF8e6cef),
        ),

        // cards
        MyCardTheme(
          cardColor: const Color(0xFF342f3f),
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
          backgroundColor: const Color(0xFF342f3f),
          textColor: Colors.white,
          iconColor: Colors.white,
        ),
        Button2Theme(
          backgroundColor: const Color(0xFF8e6cef),
          textColor: Colors.white,
          iconColor: Colors.white,
        ),

        // Text Fields
        MyTextFieldTheme(
          fillColor: const Color(0xFF342F3F),
          textColor: Colors.white,
          hintColor: Colors.grey,
        ),
      ],
    );
  }
}
