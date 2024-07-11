import 'package:flutter/material.dart';

class HadethTextDetails extends StatelessWidget {
  HadethTextDetails({super.key, required this.contant});

  String contant;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Text(
        contant,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
