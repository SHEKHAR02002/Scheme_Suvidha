import 'package:flutter/material.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:skeleton_text/skeleton_text.dart';

class CampsSkeleton extends StatelessWidget {
  const CampsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (1 / 1.7),
            crossAxisSpacing: 5),
        itemBuilder: (context, index) => SkeletonAnimation(
              child: Container(
                padding: const EdgeInsets.all(8),
                height: 200,
                decoration: shadowdecoration,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey[300]),
                          height: 120,
                          width: 120,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[300]),
                        height: 25,
                        width: 150,
                      ),
                    ]),
              ),
            ));
  }
}
