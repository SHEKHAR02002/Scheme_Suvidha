import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

Future getdata() async {
  List schemedata = [];
  await FirebaseFirestore.instance
      .collection("Scheme")
      .get()
      .then((QuerySnapshot querysnapshot) async {
    for (var doc in querysnapshot.docs) {
      schemedata.add(doc.data());
      log("come");
    }
  });

  return schemedata;
}
