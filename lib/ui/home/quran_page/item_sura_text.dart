import 'package:flutter/material.dart';
import 'package:islamy/ui/home/quran_page/sura_details_screen.dart';
import 'package:islamy/ui/home/quran_page/sura_model.dart';

class SuraTextName extends StatelessWidget {
  SuraTextName({super.key, required this.suraName, required this.index});

  String suraName;
  int index;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
            arguments: SuraData(name: suraName, index: index));
      },
      child: Text(
        suraName,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
