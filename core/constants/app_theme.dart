import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart' show AppColors;
import 'app_fonts.dart' show AppFonts;

class AppTheme {
  static ThemeData appTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    primarySwatch: AppColors.primarySwatch,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      surface: AppColors.background,
      secondary: AppColors.accent,
      error: Colors.redAccent,
      onTertiary: Colors.yellow,
      onPrimary: Colors.white,
      onSurface: Colors.white,
    ),
    fontFamily: AppFonts.main,
    cardColor: AppColors.blackShade,
    dividerColor: AppColors.borderColor,

    // // System UI components
    // dialogTheme: DialogTheme(
    //   backgroundColor: AppColors.blackShade,
    //   titleTextStyle: TextStyle(
    //     color: Colors.white,
    //     fontSize: 20.sp,
    //     fontWeight: FontWeight.bold,
    //   ),
    //   contentTextStyle: TextStyle(
    //     color: Colors.white.withValues(alpha: 0.8),
    //     fontSize: 16.sp,
    //   ),
    // ),

    // // Date picker customization
    // datePickerTheme: DatePickerThemeData(
    //   backgroundColor: AppColors.blackShade,
    //   headerBackgroundColor: AppColors.primary,
    //   headerForegroundColor: Colors.white,
    //   dayStyle: TextStyle(color: Colors.white),
    //   weekdayStyle: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
    //   yearStyle: TextStyle(color: Colors.white),
    //   dividerColor: AppColors.borderColor,
    // ),

    // // Time picker customization
    // timePickerTheme: TimePickerThemeData(
    //   backgroundColor: AppColors.blackShade,
    //   hourMinuteTextColor: Colors.white,
    //   hourMinuteColor: AppColors.primary.withValues(alpha: 0.2),
    //   dayPeriodTextColor: Colors.white,
    //   dayPeriodColor: AppColors.primary.withValues(alpha: 0.2),
    //   dialHandColor: AppColors.primary,
    //   dialBackgroundColor: AppColors.blackShade,
    //   dialTextColor: Colors.white,
    //   entryModeIconColor: Colors.white,
    // ),

    // // Cupertino components (for iOS-style pickers)
    // cupertinoOverrideTheme: CupertinoThemeData(
    //   primaryColor: AppColors.primary,
    //   barBackgroundColor: AppColors.blackShade,
    //   scaffoldBackgroundColor: AppColors.background,
    //   textTheme: CupertinoTextThemeData(
    //     pickerTextStyle: TextStyle(
    //       color: Colors.white,
    //       fontSize: 20.sp,
    //     ),
    //   ),
    // ),

    // App bar customization
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),

    // // Button theming
    // filledButtonTheme: FilledButtonThemeData(
    //   style: ButtonStyle(
    //     backgroundColor: WidgetStatePropertyAll(AppColors.primary),
    //     foregroundColor: WidgetStatePropertyAll(Colors.white),
    //     textStyle: WidgetStatePropertyAll(
    //       TextStyle(
    //         fontSize: 16.sp,
    //         fontWeight: FontWeight.w600,
    //       ),
    //     ),
    //     padding: WidgetStatePropertyAll(
    //       EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
    //     ),
    //     shape: WidgetStatePropertyAll(
    //       RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(12.r),
    //       ),
    //     ),
    //   ),
    // ),

    // Text theming
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppColors.white,
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: AppColors.white,
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: AppColors.white,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: AppColors.white,
        fontSize: 18.sp,
        fontFamily: AppFonts.main,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: AppColors.white,
        fontSize: 14.sp,
        fontFamily: AppFonts.main,
      ),
      bodySmall: TextStyle(
        color: AppColors.white,
        fontSize: 12.sp,
        fontFamily: AppFonts.main,
      ),
      labelLarge: TextStyle(
        color: AppColors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    ),

    // // Input decoration theming
    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   fillColor: AppColors.blackShade,
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12.r),
    //     borderSide: BorderSide(color: AppColors.borderColor),
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12.r),
    //     borderSide: BorderSide(color: AppColors.borderColor),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12.r),
    //     borderSide: BorderSide(color: AppColors.primary),
    //   ),
    //   labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
    //   hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
    // ),

    // // Card theming
    // cardTheme: CardTheme(
    //   color: AppColors.blackShade,
    //   margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(12.r),
    //     side: BorderSide(color: AppColors.borderColor, width: 1),
    //   ),
    // ),
  );
}
