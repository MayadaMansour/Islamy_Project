import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/ui/home/hadeth_page/hadeth_model.dart';
import 'package:islamy/utils/color_resource/color_resources.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/app_config_provider.dart';
import 'item_hadeth_text.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<HadethData> verses = [];

  @override
  void initState() {
    super.initState();
    loadFile();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(
      children: [
        Expanded(
          child: Image.asset(
            "assets/images/hadeth_logo.png",
          ),
        ),
        Divider(
          color: provider.isDark()
              ? ColorResources.yellowText
              : ColorResources.primaryLightColor,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.hadethName,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Divider(
          color: provider.isDark()
              ? ColorResources.yellowText
              : ColorResources.primaryLightColor,
          thickness: 3,
        ),
        Expanded(
          flex: 2,
          child: verses.isEmpty
              ? Center(
            child: CircularProgressIndicator(
              color: ColorResources.primaryLightColor,
            ),
          )
              : ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return HadethTextName(
                data: verses[index],
              );
            },
            itemCount: verses.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: provider.isDark()
                          ? ColorResources.yellowText
                          : ColorResources.primaryLightColor,
                      thickness: 1,
                    );
            },
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
