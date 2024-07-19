import 'package:flutter/material.dart';
import 'package:islamy/utils/color_resource/color_resources.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/app_config_provider.dart';

class HadethTextDetails extends StatelessWidget {
  HadethTextDetails({super.key, required this.contant});

  String contant;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Text(
        contant,
        textAlign: TextAlign.center,
        style: provider.isDark()
            ? Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ColorResources.yellowText)
            : Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
