import 'package:flutter/material.dart';
import 'package:islamy/utils/color_resource/color_resources.dart';

class HadethScreen extends StatelessWidget {
  const HadethScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            "assets/images/hadeth_logo.png",
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: ColorResources.primaryLightColor,
            thickness: 3,
          ),
          const Text(
            "الأحاديث",
            style: TextStyle(fontFamily: "ElMessiri", fontSize: 25),
          ),
          Divider(
            color: ColorResources.primaryLightColor,
            thickness: 3,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) => const Text(
                "الحديث رقم 1",
                style: TextStyle(fontFamily: "Flat", fontSize: 22),
                textAlign: TextAlign.center,
              ),
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
