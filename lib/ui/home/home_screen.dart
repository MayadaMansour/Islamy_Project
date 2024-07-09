import 'package:flutter/material.dart';
import 'package:islamy/ui/home/quran_page/quran.dart';
import 'package:islamy/ui/home/radio_page/radio.dart';
import 'package:islamy/ui/home/sebha_page/sebha.dart';

import '../../utils/color_resource/color_resources.dart';
import 'hadeth_page/hadeth.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex =0;
  List<Widget> tabs=[
    QuranScreen(),HadethScreen(),SebhaScreen(),RadioScreen()
  ];

  @override
  Widget build(BuildContext context) {
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
              "Islamy",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: ColorResources.primaryLightColor
            ),
            child: BottomNavigationBar(

              currentIndex: selectedIndex,
              onTap: (index){
                setState(() {
                  selectedIndex=index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/icon_quran.png")),
                    label: "Quran"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
                    label: "Hadeth"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                    label: "Sebha"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
                    label: "Radio")
              ],

            ),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }
}
