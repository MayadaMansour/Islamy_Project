import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/ui/home/hadeth_page/hadeth_model.dart';
import 'package:islamy/utils/color_resource/color_resources.dart';

import 'item_hadeth_text.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<HadethData> verses = [];

  @override
  Widget build(BuildContext context) {
    if (verses.isEmpty) {
      loadFile();
    }
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            "assets/images/hadeth_logo.png",
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Divider(
          color: ColorResources.primaryLightColor,
          thickness: 3,
        ),
        Text(
          "الأحاديث",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Divider(
          color: ColorResources.primaryLightColor,
          thickness: 3,
        ),
        Expanded(
          flex: 3,
          child: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: ColorResources.primaryLightColor,
                  ),
                )
              : Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return HadethTextName(
                        data: verses[index],
                      );
                    },
                    itemCount: verses.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: ColorResources.primaryLightColor,
                        thickness: 1,
                      );
                    },
                  ),
                ),
        )
      ],
    );
  }

  void loadFile() async {
    String content = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> hadethList = content.split("#\r\n");
    List<HadethData> loadedVerses = [];
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLines = hadethList[i].split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      HadethData hadeth = HadethData(title: title, contant: hadethLines);
      loadedVerses.add(hadeth);
    }
    setState(() {
      verses = loadedVerses;
    });
  }
}
