import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/ui/home/hadeth_page/hadeth_model.dart';
import 'package:islamy/utils/color_resource/color_resources.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/app_config_provider.dart';
import 'item_hadeth_details.dart';

class HadethDetailsScreen extends StatelessWidget {
  HadethDetailsScreen({super.key});

  static const String routeName = "Hadeth_Details";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as HadethData;

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
              child: Text(
                args.title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Container(
              color: ColorResources.primaryLightColor,
              width: 280,
              height: 1.5,
            ),
            Expanded(
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
                      child: HadethTextDetails(
                        contant: (args.contant[index]),
                      ),
                    );
                  },
                  itemCount: args.contant.length,
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
