import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/core/provider/app_config_provider.dart';
import 'package:islamy/ui/board/board_screen.dart';
import 'package:islamy/ui/home/hadeth_page/hadeth_details_screen.dart';
import 'package:islamy/ui/home/home_screen.dart';
import 'package:islamy/ui/home/quran_page/sura_details_screen.dart';
import 'package:islamy/utils/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppConfigProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppConfigProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          theme: MyThemeData.lightMode,
          themeMode: provider.themeMode,
          darkTheme: MyThemeData.darkMode,
          initialRoute: SplashScreen.routeName,
          locale: Locale(provider.appLanguage),
          routes: {
            SplashScreen.routeName: (context) => SplashScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
            SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
            HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
          },
          home: const SplashScreen(),
        );
      },
    );
  }
}

