import 'package:flutter/material.dart';
import 'package:scheme/widget/campcards.dart';

class CampView extends StatelessWidget {
  final List ngoDataList;
  final double width;
  const CampView({super.key, required this.ngoDataList, required this.width});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: ngoDataList.length > 2 ? 2 : ngoDataList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: (1 / 1.7)),
        itemBuilder: (context, index) => CampCard(
            id: ngoDataList[index]['campid'],
            address: ngoDataList[index]['place'],
            phoneno: ngoDataList[index]['date'],
            name: ngoDataList[index]['campname']));
  }
}
