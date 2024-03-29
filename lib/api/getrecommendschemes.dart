import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scheme/data/userdata.dart';

Future<List> getrecommendApi() async {
  final random = Random();
  List schemedata = [], recommendList = [];
  if (userDetail != null) {
    await FirebaseFirestore.instance
        .collection("Schemes")
        .where("disabilityType",
            isEqualTo: userDetail!.disabilitytype.toString())
        .get()
        .then((QuerySnapshot querysnapshot) async {
      for (var doc in querysnapshot.docs) {
        schemedata.add(doc.data());
      }
      // schemedata.removeWhere((element) => element["validity"] != "Every Year");
    });
  }
  await FirebaseFirestore.instance
      .collection("Schemes")
      .where("disabilityType", isEqualTo: "All Disability")
      .get()
      .then((QuerySnapshot querysnapshot) async {
    for (var doc in querysnapshot.docs) {
      schemedata.add(doc.data());
    }
    // schemedata.removeWhere((element) => element["validity"] != "Every Year");
  });

  for (int i = 0; i < 3; i++) {
    recommendList.add(schemedata[random.nextInt(schemedata.length)]);
  }

  return recommendList;
}
