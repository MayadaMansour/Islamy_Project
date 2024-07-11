import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/ui/home/quran_page/sura_model.dart';
import 'package:islamy/utils/color_resource/color_resources.dart';

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
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Stack(children: [
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
            "إسلامي",
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
                    color: ColorResources.primaryLightColor,
                  )
                ],
              ),
            ),
            Container(
              color: ColorResources.primaryLightColor,
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
                          color: ColorResources.white,
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
