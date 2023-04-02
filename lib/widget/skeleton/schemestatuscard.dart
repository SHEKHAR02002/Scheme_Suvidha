import 'package:flutter/material.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SchemeStatusCard extends StatelessWidget {
  const SchemeStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonAnimation(
      child: Container(
        decoration: shadowdecoration,
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  height: 24,
                  width: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300]),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 30,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300]),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
