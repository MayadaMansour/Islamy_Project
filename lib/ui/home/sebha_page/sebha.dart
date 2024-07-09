import 'package:flutter/material.dart';
import 'package:islamy/utils/color_resource/color_resources.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  double turns = 0.0;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 350, // Set the height according to your needs
            width: double.infinity, // Set width according to your needs
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 0,
                  child: Image.asset(
                    "assets/images/head_sebha_logo.png",
                  ),
                ),
                Positioned(
                  top: 80, // Adjust this value to create the desired space
                  child: AnimatedRotation(
                    turns: turns,
                    duration: const Duration(seconds: 1),
                    child: Image.asset(
                      "assets/images/body_sebha_logo.png",
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                turns += 1 / 8;
                count++;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  ColorResources.primaryLightColor.withOpacity(0.4),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            ),
            child: Text(
              "$count",
              style: TextStyle(
                  fontFamily: "Flat",
                  fontSize: 22,
                  color: ColorResources.white),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorResources.primaryLightColor,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            child: Text(
              "سبحان الله",
              style: TextStyle(
                fontFamily: "Flat",
                fontSize: 22,
                color: ColorResources.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
