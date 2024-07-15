import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/ui/home/quran_page/quran.dart';
import 'package:islamy/ui/home/radio_page/radio.dart';
import 'package:islamy/ui/home/sebha_page/sebha.dart';
import 'package:islamy/ui/home/setting/setting_screen.dart';
import 'package:provider/provider.dart';

import '../../core/provider/app_config_provider.dart';
import '../../utils/color_resource/color_resources.dart';
import 'hadeth_page/hadeth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "Home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranScreen(),
    const HadethScreen(),
    const SebhaScreen(),
    const RadioScreen(),
    const SettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Stack(
      children: [
        Image.asset(
          "assets/images/default_bg.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context)!.appTitle,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: ColorResources.primaryLightColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                      AssetImage("assets/images/icon_quran.png")),
                  label: AppLocalizations.of(context)!.quranIcon,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                      AssetImage("assets/images/icon_hadeth.png")),
                  label: AppLocalizations.of(context)!.hadethIcon,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                      AssetImage("assets/images/icon_sebha.png")),
                  label: AppLocalizations.of(context)!.sebhaIcon,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                      AssetImage("assets/images/icon_radio.png")),
                  label: AppLocalizations.of(context)!.radioIcon,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.settings,
                    size: 25,
                  ),
                  label: AppLocalizations.of(context)!.settingIcon,
                ),
              ],
            ),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }
}
