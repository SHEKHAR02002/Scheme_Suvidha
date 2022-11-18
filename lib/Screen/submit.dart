import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';

class Submit extends StatefulWidget {
  const Submit({super.key});

  @override
  State<Submit> createState() => _SubmitState();
}

class _SubmitState extends State<Submit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          const Image(image: AssetImage("assets/submited.png")),
          Text(
            "Application Submitted",
            style: TextStyle(
                fontFamily: "overpass",
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: text1),
          ),
        ],
      )),
    );
  }
}
