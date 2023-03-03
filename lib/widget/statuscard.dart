import 'package:scheme/Theme/color.dart';
import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final bool register, verify;
  const StatusCard({super.key, required this.register, required this.verify});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 150,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [secondary3, primary])),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Padding(
          padding: EdgeInsets.only(left: 12, top: 18),
          child: Text(
            "Status",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Zilla",
                fontSize: 24,
                fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            register ? "Registration : Done" : "Registration : Not Done",
            style: const TextStyle(
                color: Colors.black,
                fontFamily: "Overpass",
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            verify ? "Verification : Done" : "Verification : Pending",
            style: const TextStyle(
                color: Colors.black,
                fontFamily: "Overpass",
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        )
      ]),
    );
  }
}
