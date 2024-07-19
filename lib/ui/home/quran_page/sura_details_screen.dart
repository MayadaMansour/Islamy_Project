import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/ui/home/quran_page/sura_model.dart';
import 'package:islamy/utils/color_resource/color_resources.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/app_config_provider.dart';
import 'item_sura_details.dart';

class SuraDetailsScreen extends StatefulWidget {
  SuraDetailsScreen({super.key});

  static const String routeName = "Sura_Details";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraData;
    var provider = Provider.of<AppConfigProvider>(context);

    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Stack(children: [
      provider.isDark()
          ? Image.asset(
              "assets/images/dark_bg.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            )
          : Image.asset(
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    args.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.play_circle_fill,
                    color: provider.isDark()
                        ? ColorResources.yellowText
                        : ColorResources.primaryLightColor,
                  )
                ],
              ),
            ),
            Container(
              color: provider.isDark()
                  ? ColorResources.yellowText
                  : ColorResources.primaryLightColor,
              width: 280,
              height: 1.5,
            ),
            verses.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: ColorResources.primaryLightColor,
                    ),
                  )
                : Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                          vertical: MediaQuery.of(context).size.height * 0.03),
                      decoration: BoxDecoration(
                          color: provider.isDark()
                              ? ColorResources.primaryDarkColor
                              : ColorResources.white,
                          borderRadius: BorderRadius.circular(24)),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SuraTextDetails(
                              contant: verses[index],
                              index: index,
                            ),
                          );
                        },
                        itemCount: verses.length,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = content.split("\n");
    setState(() {
      verses = lines;
    });
  }
}
