import 'package:flutter/material.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SkeltonSchemeCard extends StatefulWidget {
  const SkeltonSchemeCard({super.key});

  @override
  State<SkeltonSchemeCard> createState() => _SkeltonSchemeCardState();
}

class _SkeltonSchemeCardState extends State<SkeltonSchemeCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return SkeletonAnimation(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: shadowdecoration,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300]),
                    height: 80,
                    width: 74,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[300]),
                        height: 25,
                        width: 193,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[300]),
                        height: 18,
                        width: 138,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
