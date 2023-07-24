import 'package:flutter/material.dart';
import 'package:nomura_mobile/nomura/utils.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: ColorUtils.primary,
    secondaryHeaderColor: ColorUtils.dark,
    dividerColor: Colors.transparent,
    disabledColor: ColorUtils.grey,
    errorColor: Colors.white,
    cardTheme: CardTheme(
      color: ColorUtils.lighDark,
      shadowColor: ColorUtils.grey,
      elevation: AppSize.s14,
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSize.s8,
        ),
      ),
      buttonColor: ColorUtils.primary,
      splashColor: ColorUtils.primary.withOpacity(0.7),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getThinStyle(
          color: ColorUtils.white,
        ),
        backgroundColor: ColorUtils.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSize.s8,
          ),
        ),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: getBoldStyle(
        color: ColorUtils.white,
        fontSize: FontSize.s24,
      ),
      displayMedium: getBoldStyle(
        color: ColorUtils.white,
        fontSize: FontSize.s14,
      ),
      displaySmall: getThinStyle(
        color: ColorUtils.white,
        fontSize: FontSize.s16,
      ),
      headlineMedium: getBoldStyle(
        color: ColorUtils.dark,
        fontSize: FontSize.s20,
      ),
      headlineSmall: getThinStyle(
        color: ColorUtils.white,
        fontSize: FontSize.s18,
      ),
      titleMedium: getThinStyle(
        color: ColorUtils.white,
        fontSize: FontSize.s14,
      ),
      bodySmall: getThinStyle(
        color: ColorUtils.white,
        fontSize: FontSize.s12,
      ),
      bodyLarge: getArialRegularStyle(
        color: ColorUtils.white,
        fontSize: FontSize.s16,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getThinStyle(color: ColorUtils.grey),
      labelStyle: getThinStyle(color: ColorUtils.darkGrey),
      errorStyle: getThinStyle(color: Colors.red),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s14),
        borderSide: BorderSide(
          color: ColorUtils.grey,
          width: AppSize.s3,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s14),
        borderSide: BorderSide(
          color: ColorUtils.primary,
          width: AppSize.s3,
        ),
      ),
    ),
  );
}
