import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/utils/color_resource/color_resources.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/app_config_provider.dart';

class LanguageButtomSheet extends StatefulWidget {
  const LanguageButtomSheet({super.key});

  @override
  State<LanguageButtomSheet> createState() => _LanguageButtomSheetState();
}

class _LanguageButtomSheetState extends State<LanguageButtomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      height: 150,
      color: provider.isDark()
          ? ColorResources.primaryDarkColor
          : ColorResources.white,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
                onTap: () {
                  provider.changeLanguage("en");
                },
                child: provider.appLanguage == "en"
                    ? getSelectedItemWidget(
                        AppLocalizations.of(context)!.english)
                    : getUnSelectedItemWidget(
                        AppLocalizations.of(context)!.english)),
            const SizedBox(
              height: 15,
            ),
            InkWell(
                onTap: () {
                  provider.changeLanguage("ar");
                },
                child: provider.appLanguage == "ar"
                    ? getSelectedItemWidget(
                        AppLocalizations.of(context)!.arabic)
                    : getUnSelectedItemWidget(
                        AppLocalizations.of(context)!.arabic)),
          ],
        ),
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ColorResources.primaryLightColor)),
        Icon(
          Icons.check,
          size: 30,
          color: ColorResources.primaryLightColor,
        )
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
