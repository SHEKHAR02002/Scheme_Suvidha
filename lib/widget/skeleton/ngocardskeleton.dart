import 'package:flutter/material.dart';
import 'package:scheme/Theme/decoration.dart';

class NGOCardSkeleton extends StatelessWidget {
  const NGOCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: shadowdecoration,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300]),
              height: 185,
              width: width - 60,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
                height: 23,
                width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[300])),
            const SizedBox(
              height: 5,
            ),
            Container(
                height: 20,
                width: 107,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[300]))
          ],
        ),
      ),
    );
  }
}
