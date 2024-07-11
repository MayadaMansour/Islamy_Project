import 'package:flutter/material.dart';
import 'package:islamy/utils/color_resource/color_resources.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Expanded(
            child: Image.asset(
              "assets/images/radio_image.png",
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_previous,
                      size: 50,
                      color: ColorResources.primaryLightColor,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.play_arrow,
                        size: 50, color: ColorResources.primaryLightColor)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.skip_next,
                        size: 50, color: ColorResources.primaryLightColor)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
