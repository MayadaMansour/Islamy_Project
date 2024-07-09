import 'dart:async';

import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BoardScreenState();
  }
}

class _BoardScreenState extends State<BoardScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image(
          image: AssetImage("assets/images/light_bg.png",),fit: BoxFit.fill,
        ));
  }
}
