import 'package:scheme/Theme/color.dart';
import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 150,
      width: width,
      decoration: BoxDecoration(
          color: secondary3, borderRadius: BorderRadius.circular(5)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 18),
          child: Text(
            "Status",
            style: TextStyle(
                color: primary,
                fontFamily: "Zilla",
                fontSize: 24,
                fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Registration : Done",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Overpass",
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Verification : Pending",
            style: TextStyle(
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
