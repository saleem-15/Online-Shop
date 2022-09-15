import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dark_theme_colors.dart';
import 'my_fonts.dart';
import 'light_theme_colors.dart';

class MyStyles {
  ///icons theme
  static IconThemeData getIconTheme({required bool isLightTheme}) => IconThemeData(
        color: isLightTheme ? LightThemeColors.iconColor : DarkThemeColors.iconColor,
      );
  static TabBarTheme getTabBarTheme({required bool isLightTheme}) => TabBarTheme(
        indicator: BoxDecoration(
          color: isLightTheme ? LightThemeColors.primaryColor : DarkThemeColors.primaryColor,
        ),
      );

  ///app bar theme
  static AppBarTheme getAppBarTheme({required bool isLightTheme}) => AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
        elevation: 0,
        titleTextStyle: getTextTheme(isLightTheme: isLightTheme).bodyText1!.copyWith(
              color: Colors.white,
              fontSize: MyFonts.appBarTittleSize,
            ),
        iconTheme: IconThemeData(
            color: isLightTheme ? LightThemeColors.appBarIconsColor : DarkThemeColors.appBarIconsColor),
        backgroundColor: isLightTheme ? LightThemeColors.appBarColor : DarkThemeColors.appbarColor,
      );

  ///text theme
  static TextTheme getTextTheme({required bool isLightTheme}) => TextTheme(
        button: MyFonts.buttonTextStyle.copyWith(fontSize: MyFonts.buttonTextSize),
        //
        bodyText1: (MyFonts.bodyTextStyle).copyWith(
          fontWeight: FontWeight.bold,
          fontSize: MyFonts.body1TextSize,
          color: isLightTheme ? LightThemeColors.bodyTextColor : DarkThemeColors.bodyTextColor,
        ),
        //
        bodyText2: (MyFonts.bodyTextStyle).copyWith(
          fontSize: MyFonts.body2TextSize,
          color: isLightTheme ? LightThemeColors.bodyTextColor : DarkThemeColors.bodyTextColor,
        ),
        //
        headline1: (MyFonts.headlineTextStyle).copyWith(
          fontSize: MyFonts.headline1TextSize,
          fontWeight: FontWeight.bold,
          color: isLightTheme ? LightThemeColors.headlinesTextColor : DarkThemeColors.headlinesTextColor,
        ),
        //
        headline2: (MyFonts.headlineTextStyle).copyWith(
            fontSize: MyFonts.headline2TextSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme ? LightThemeColors.headlinesTextColor : DarkThemeColors.headlinesTextColor),
        //
        headline3: (MyFonts.headlineTextStyle).copyWith(
            fontSize: MyFonts.headline3TextSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme ? LightThemeColors.headlinesTextColor : DarkThemeColors.headlinesTextColor),
        //
        headline4: (MyFonts.headlineTextStyle).copyWith(
            fontSize: MyFonts.headline4TextSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme ? LightThemeColors.headlinesTextColor : DarkThemeColors.headlinesTextColor),
        //
        headline5: (MyFonts.headlineTextStyle).copyWith(
            fontSize: MyFonts.headline5TextSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme ? LightThemeColors.headlinesTextColor : DarkThemeColors.headlinesTextColor),
        //
        headline6: (MyFonts.headlineTextStyle).copyWith(
            fontSize: MyFonts.headline6TextSize,
            fontWeight: FontWeight.w500,
            color: isLightTheme ? LightThemeColors.headlinesTextColor : DarkThemeColors.headlinesTextColor),
        caption: TextStyle(
            color: isLightTheme ? LightThemeColors.captionTextColor : DarkThemeColors.captionTextColor,
            fontSize: MyFonts.captionTextSize),
      );

  // Chip theme
  static ChipThemeData getChipTheme({required bool isLightTheme}) {
    return ChipThemeData(
      backgroundColor: Colors.transparent,
      brightness: Brightness.light,
      labelStyle: getChipTextStyle(isLightTheme: isLightTheme),
      secondaryLabelStyle: getChipTextStyle(isLightTheme: isLightTheme).copyWith(color: Colors.white),
      selectedColor: myBlack,
      disabledColor: Colors.white,
      padding: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        side: BorderSide(
          color: myBlack,
          width: 1.5.sp,
        ),
      ),
    );
  }

  ///Chips text style
  static TextStyle getChipTextStyle({required bool isLightTheme}) {
    return MyFonts.chipTextStyle.copyWith(
      fontSize: MyFonts.chipTextSize,
      color: isLightTheme ? LightThemeColors.chipTextColor : DarkThemeColors.chipTextColor,
    );
  }

  // elevated button text style
  static MaterialStateProperty<TextStyle?>? getElevatedButtonTextStyle(bool isLightTheme,
      {bool isBold = true, double? fontSize}) {
    return MaterialStateProperty.resolveWith<TextStyle>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return MyFonts.buttonTextStyle.copyWith(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: fontSize ?? MyFonts.buttonTextSize,
              //
              color: isLightTheme ? LightThemeColors.buttonTextColor : DarkThemeColors.buttonTextColor);
        } else if (states.contains(MaterialState.disabled)) {
          return MyFonts.buttonTextStyle.copyWith(
              fontSize: fontSize ?? MyFonts.buttonTextSize,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: isLightTheme
                  ? LightThemeColors.buttonDisabledTextColor
                  : DarkThemeColors.buttonDisabledTextColor);
        }
        return MyFonts.buttonTextStyle.copyWith(
            fontSize: fontSize ?? MyFonts.buttonTextSize,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: isLightTheme
                ? LightThemeColors.buttonTextColor
                : DarkThemeColors.buttonTextColor); // Use the component's default.
      },
    );
  }

  //elevated button theme data
  static ElevatedButtonThemeData getElevatedButtonTheme({required bool isLightTheme}) =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
          ),
          fixedSize: MaterialStateProperty.all(Size(330.w, 55)),
          elevation: MaterialStateProperty.all(7),
          shadowColor: MaterialStateProperty.all(myBlack),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 8.h)),
          textStyle: getElevatedButtonTextStyle(isLightTheme),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              //pressed state
              if (states.contains(MaterialState.pressed)) {
                return isLightTheme
                    ? LightThemeColors.buttonColor.withOpacity(0.5)
                    : DarkThemeColors.buttonColor.withOpacity(0.5);
                // disabled state
              } else if (states.contains(MaterialState.disabled)) {
                return isLightTheme
                    ? LightThemeColors.buttonDisabledColor
                    : DarkThemeColors.buttonDisabledColor;
              }
              return isLightTheme
                  ? LightThemeColors.buttonColor
                  : DarkThemeColors.buttonColor; // Use the component's default.
            },
          ),
        ),
      );

  static getRadioButtonTheme({required bool isLightTheme}) => RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(
          isLightTheme ? LightThemeColors.radioColor : DarkThemeColors.radioColor,
        ),
      );

  static getDividerTheme({required bool isLightTheme}) => DividerThemeData(
        color: isLightTheme ? LightThemeColors.dividerColor : DarkThemeColors.dividerColor,
      );

  static getInputDecorationTheme({required bool isLightTheme}) => InputDecorationTheme(
        filled: true,
        fillColor: searchTextfieldColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.r),
          borderSide: const BorderSide(color: searchTextfieldColor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.r),
          borderSide: const BorderSide(color: searchTextfieldColor, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.r),
          borderSide: const BorderSide(color: searchTextfieldColor, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.r),
          borderSide: const BorderSide(color: searchTextfieldColor, width: 1.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.r),
          borderSide: const BorderSide(color: searchTextfieldColor, width: 1.5),
        ),
      );

  static getDialogTheme({required bool isLightTheme}) => DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      );

  //*************************** My Custom Styles For a Specific Use Cases  ***********************************

  static ButtonStyle getGreyElevatedButtonStyle() => ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color(0xffe7e7e7)),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
        fixedSize: MaterialStateProperty.all(Size(330.w, 55)),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 8.h)),
        textStyle: MaterialStateProperty.all(
          (MyFonts.bodyTextStyle).copyWith(
            fontWeight: FontWeight.bold,
            fontSize: MyFonts.body1TextSize,
            color: LightThemeColors.bodyTextColor,
          ),
        ),
      );
  static ButtonStyle getSignupWithGoogleButtonStyle() => ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(330.w, 60)),
        backgroundColor: MaterialStateProperty.all(LightThemeColors.scaffoldBackgroundColor),

        /// Splash color
        overlayColor: MaterialStateProperty.all(Colors.grey[200]),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(
              width: .2.sp,
              color: LightThemeColors.dividerColor,
            ),
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
      );

  static CheckboxThemeData getCheckBoxStyle() => CheckboxThemeData(
        fillColor: MaterialStateProperty.all(myBlack),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      );
}
