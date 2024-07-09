import 'package:flutter/material.dart';
import 'package:islamy/ui/board/board_screen.dart';
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
        home: const BoardScreen(),
      ),
    );
  }
}
