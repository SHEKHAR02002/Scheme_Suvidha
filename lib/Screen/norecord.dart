import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';

class NoRecord extends StatefulWidget {
  const NoRecord({super.key});

  @override
  State<NoRecord> createState() => _NoRecordState();
}

class _NoRecordState extends State<NoRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          Image(image: AssetImage("assets/norecord.jpg")),
          Text(
            "No Record",
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
