import 'package:flutter/material.dart';

import '../color_resource/color_resources.dart';

class MyThemeData{
  static final ThemeData lightMode = ThemeData(
    primaryColor: ColorResources.primaryLightColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: ColorResources.blackText,
      selectedLabelStyle: TextStyle(
          color: ColorResources.blackText,
          fontWeight: FontWeight.normal,
          fontSize: 15,
          fontFamily: "Flat"),
      selectedIconTheme: const IconThemeData(size: 32),
      unselectedIconTheme: const IconThemeData(size: 32),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
          color: ColorResources.blackText,
          fontWeight: FontWeight.bold,
          fontSize: 30,
          fontFamily: "ElMessiri"),
      bodyMedium: TextStyle(
          color: ColorResources.blackText,
          fontWeight: FontWeight.w700,
          fontSize: 22,
          fontFamily: "Flat"),
      bodySmall: TextStyle(
          color: ColorResources.blackText,
          fontWeight: FontWeight.w700,
          fontSize: 20,
          fontFamily: "Flat"),
    ),
  );

}





