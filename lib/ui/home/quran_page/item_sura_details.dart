import 'package:flutter/material.dart';

class SuraTextDetails extends StatelessWidget {
  SuraTextDetails({super.key, required this.contant, required this.index});

  String contant;
  int index;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Text(
        "$contant (${index + 1})",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
