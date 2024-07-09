import 'package:flutter/material.dart';
import 'package:islamy/utils/color_resource/color_resources.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            "assets/images/qur2an_screen_logo.png",
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: ColorResources.primaryLightColor,
            thickness: 3,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "عدد الأيات",
                style: TextStyle(fontFamily: "ElMessiri", fontSize: 25),
              ),
              Text(
                "أسم السوره",
                style: TextStyle(fontFamily: "ElMessiri", fontSize: 25),
              ),
            ],
          ),
          Divider(
            color: ColorResources.primaryLightColor,
            thickness: 3,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) => const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "608",
                    style: TextStyle(fontFamily: "Flat", fontSize: 25),
                  ),
                  Text(
                    "سوره البقرة",
                    style: TextStyle(fontFamily: "Flat", fontSize: 22),
                  ),
                ],
              ),
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
