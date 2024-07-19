import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/app_config_provider.dart';
import '../../../utils/color_resource/color_resources.dart';

class SuraTextDetails extends StatelessWidget {
  SuraTextDetails({super.key, required this.contant, required this.index});

  String contant;
  int index;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Text(
        "$contant (${index + 1})",
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
