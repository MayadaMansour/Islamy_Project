import 'package:flutter/material.dart';
import 'package:islamy/ui/board/board_screen.dart';
import 'package:islamy/ui/home/hadeth_page/hadeth_details_screen.dart';
import 'package:islamy/ui/home/home_screen.dart';
import 'package:islamy/ui/home/quran_page/sura_details_screen.dart';
import 'package:islamy/utils/theme/theme.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyThemeData.lightMode,
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => SplashScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
          HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
        },
        home: const SplashScreen(),
      ),
    );
  }
}
