import 'package:flutter/material.dart';
import 'package:islamy/ui/home/hadeth_page/hadeth_details_screen.dart';
import 'package:islamy/ui/home/hadeth_page/hadeth_model.dart';

class HadethTextName extends StatelessWidget {
  HadethTextName({
    super.key,
    required this.data,
  });

  HadethData data;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context)
            .pushNamed(HadethDetailsScreen.routeName, arguments: data);
      },
      child: Text(
        data.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
