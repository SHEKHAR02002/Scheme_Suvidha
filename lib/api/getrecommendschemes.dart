import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

Future<List> getrecommendApi() async {
  final random = Random();
  List schemedata = [], recommendList = [];
  await FirebaseFirestore.instance
      .collection("Schemes")
      .where("disabilityType", isEqualTo: "All Disability")
      .get()
      .then((QuerySnapshot querysnapshot) async {
    for (var doc in querysnapshot.docs) {
      schemedata.add(doc.data());
    }
    schemedata.removeWhere((element) => element["validity"] != "Every Year");
    for (int i = 0; i < 3; i++) {
      recommendList.add(schemedata[random.nextInt(schemedata.length)]);
    }
    return recommendList;
  });
  return recommendList;
}
