import 'package:flutter/material.dart';
import '../color_resource/color_resources.dart';

class MyThemeData{
  static final ThemeData lightMode = ThemeData(
    primaryColor:ColorResources.primaryLightColor ,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
     selectedItemColor: ColorResources.blackText
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: ColorResources.blackText,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      )
    )

  );

}





// ThemeData themeData = ThemeData(
//   scaffoldBackgroundColor: ColorResources.white,
//   fontFamily: 'Poppins',
//   // primaryColor:ColorResources.primaryBackground,
//   // canvasColor:ColorResources.primaryBackground,
//   // colorScheme: ThemeData().colorScheme.copyWith(primary:
//   // ColorResources.primaryBackground),
//   brightness: Brightness.light,
//   cardColor: ColorResources.white,
//   // hintColor: ColorResources.hintText,
//   scrollbarTheme: const ScrollbarThemeData(
//     thickness: MaterialStatePropertyAll(5),
//     minThumbLength: 20
//   ),
//   iconTheme:  IconThemeData(
//     color: ColorResources.white,
//   ),
// );




// ThemeData darkThemeData= ThemeData(
//   scaffoldBackgroundColor: Colors.black,
//   fontFamily: 'Poppins',
//   primaryColor:ColorResources.white,
//   canvasColor:ColorResources.white,
//   colorScheme: ThemeData().colorScheme.copyWith(primary:
//   ColorResources.white),
//   brightness: Brightness.dark,
//   // cardColor: ColorResources.black,
//   // hintColor: ColorResources.hintText,
//   scrollbarTheme: const ScrollbarThemeData(
//       thickness: MaterialStatePropertyAll(5),
//       minThumbLength: 20
//   ),
//   iconTheme:  IconThemeData(
//     // color: ColorResources.primaryBackground,
//   ),
//
//
// );
