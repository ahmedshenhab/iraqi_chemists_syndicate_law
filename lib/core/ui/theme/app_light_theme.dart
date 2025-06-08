import 'package:flutter/material.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';

class AppLightTheme {
  static ThemeData lighTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.white,
    fontFamily: "Inter",
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      titleSpacing: 0,
      backgroundColor: AppColor.white,
      elevation: 0,
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),

    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: AppColor.jet,
      fontFamily: 'Inter',
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        focusColor: AppColor.transparent,
        hoverColor: AppColor.transparent,
        highlightColor: AppColor.transparent,
      ),
    ),
  );
}
