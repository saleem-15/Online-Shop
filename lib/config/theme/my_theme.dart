import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../app/storage/my_shared_pref.dart';
import 'dark_theme_colors.dart';
import 'light_theme_colors.dart';
import 'my_styles.dart';

// ignore_for_file: deprecated_member_use

class MyTheme {
  static getThemeData({required bool isLight}) {
    return ThemeData(
      // useMaterial3: true,
      // main color (app bar,tabs..etc)
      colorScheme: isLight
          ? const ColorScheme.light().copyWith(
              primary: myBlack,
              onPrimary: LightThemeColors.onPrimaryColor,
              primaryContainer: LightThemeColors.containerColor,
              secondary: Colors.grey,
            )
          : const ColorScheme.dark().copyWith(
              primary: DarkThemeColors.primaryColor,
              onPrimary: DarkThemeColors.onPrimaryColor,
              primaryContainer: DarkThemeColors.containerColor,
              secondary: DarkThemeColors.accentColor,
              // secondary: Colors.grey,
            ),

      primaryColor: isLight ? LightThemeColors.primaryColor : DarkThemeColors.primaryColor,
      // secondary color (for checkbox,float button, radio..etc)
      accentColor: isLight ? LightThemeColors.accentColor : DarkThemeColors.accentColor,
      // color contrast (if the theme is dark text should be white for example)
      brightness: isLight ? Brightness.light : Brightness.dark,
      // card widget background color
      cardColor: isLight ? LightThemeColors.cardColor : DarkThemeColors.cardColor,
      // hint text color
      hintColor: isLight ? LightThemeColors.hintTextColor : DarkThemeColors.hintTextColor,
      // divider color
      dividerColor: isLight ? LightThemeColors.dividerColor : DarkThemeColors.dividerColor,
      // app background color
      backgroundColor: isLight ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor,
      scaffoldBackgroundColor:
          isLight ? LightThemeColors.scaffoldBackgroundColor : DarkThemeColors.scaffoldBackgroundColor,

      // progress bar theme
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: isLight ? LightThemeColors.primaryColor : DarkThemeColors.primaryColor,
      ),

      // appBar theme
      appBarTheme: MyStyles.getAppBarTheme(isLightTheme: isLight),

      // elevated button theme
      elevatedButtonTheme: MyStyles.getElevatedButtonTheme(isLightTheme: isLight),

      // text theme
      textTheme: MyStyles.getTextTheme(isLightTheme: isLight),

      // chip theme
      chipTheme: MyStyles.getChipTheme(isLightTheme: isLight),

      // icon theme
      iconTheme: MyStyles.getIconTheme(isLightTheme: isLight),

      //divider
      dividerTheme: MyStyles.getDividerTheme(isLightTheme: isLight),

      radioTheme: MyStyles.getRadioButtonTheme(isLightTheme: isLight),

      // textField theme
      inputDecorationTheme: MyStyles.getInputDecorationTheme(isLightTheme: isLight),
      textSelectionTheme: MyStyles.getTextSelectionTheme(isLightTheme: isLight),
      //dialog
      dialogTheme: MyStyles.getDialogTheme(isLightTheme: isLight),

      popupMenuTheme: MyStyles.getPopupMenuThemeTheme(isLightTheme: isLight),

      //checkBox
      checkboxTheme: MyStyles.getCheckBoxStyle(isLightTheme: isLight),
    );
  }

  /// update app theme and save theme mode to shared pref
  /// (so when the app is killed and up again theme will remain the same)
  static changeTheme(ThemeMode themeMode) {
    /// store the new theme mode on get storage
    MySharedPref.setThemeMode(themeMode);

    Get.changeThemeMode(themeMode);
  }
}
