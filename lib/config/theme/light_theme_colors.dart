import 'package:flutter/material.dart';

//CUSTOM COLORS
const Color myBlack = Color(0xFF32323D);
const Color lightRed = Color(0xFFf75555);

const Color lightGrey = Color(0xfff5f5f5);

class LightThemeColors {
  //light swatch
  static const Color primaryColor = Color(0xFF101010);
  static const Color onPrimaryColor = lightGrey;
  static const Color containerColor = lightGrey; //used on containers
  static const Color secondaryColor = myBlack;
  static const Color accentColor = Color(0xFFD9EDE1);

  //APPBAR
  static const Color appBarColor = Colors.transparent;

  //SCAFFOLD
  static const Color scaffoldBackgroundColor = Color(0xfffafafa);
  //  Color(0xfffefefe);
  static const Color backgroundColor = Colors.white;
  static const Color dividerColor = Color(0xff686868);
  static const Color cardColor = Colors.white;
  // static const Color cardColor = Color(0xfffafafa);

  //ICONS
  static const Color appBarIconsColor = Colors.white;
  static const Color iconColor = Colors.black;

  //BUTTON
  static const Color buttonColor = myBlack;
  static const Color buttonTextColor = Colors.white;
  static const Color buttonDisabledColor = Colors.grey;
  static const Color buttonDisabledTextColor = Colors.black;

  //TEXT
  static const Color bodyTextColor = Color(0xff424242);
  static const Color headlinesTextColor = Colors.black;
  static const Color captionTextColor = Colors.grey;
  static const Color hintTextColor = Color(0xff9e9e9e);

  //Card
  static const Color CardColor = onPrimaryColor;

  //chip
  static const Color ChipBackground = myBlack;
  static const Color selectedChipBackground = myBlack;
  static const Color chipTextColor = Colors.black;

  // progress bar indicator
  static const Color progressIndicatorColor = Color(0xFF40A76A);

  // Radio Button
  static const Color radioColor = primaryColor;

  // TextField
  static const Color textFieldColor = onPrimaryColor;
  static const Color cursorColor = Colors.black;
  static const Color textSelectionHandleColor = myBlack;
}
