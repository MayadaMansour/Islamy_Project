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
    String tasbeehText;
    if (count < 33) {
      tasbeehText = "سبحان الله";
    } else if (count < 66) {
      tasbeehText = "الحمد لله";
    } else {
      tasbeehText = "الله أكبر";
    }

    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 350,
            width: double.infinity,
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
          const SizedBox(
            height: 10,
          ),
          Text(
            "عدد التسبيحات",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 10,
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorResources.primaryLightColor,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            child: Text(
              tasbeehText,
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
