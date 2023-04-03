import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scheme/Screen/home.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/data/userdata.dart';

Future getSchemes({String filter = "none"}) async {
  List schemedata = [];
  if (filter != "none") {
    await FirebaseFirestore.instance
        .collection("Schemes")
        .where("category", isEqualTo: filter)
        .get()
        .then((QuerySnapshot querysnapshot) async {
      for (var doc in querysnapshot.docs) {
        schemedata.add(doc.data());
      }
    });
  } else {
    await FirebaseFirestore.instance
        .collection("Schemes")
        .get()
        .then((QuerySnapshot querysnapshot) async {
      for (var doc in querysnapshot.docs) {
        schemedata.add(doc.data());
      }
    });
  }

  return schemedata;
}

Future getappliedscheme() async {
  List appliedscheme = [];
  await FirebaseFirestore.instance
      .collection(
          "Users/${FirebaseAuth.instance.currentUser!.uid}/AppliedScheme")
      .get()
      .then((QuerySnapshot querysnapshot) async {
    for (var doc in querysnapshot.docs) {
      appliedscheme.add(doc.data());
    }
  });
  return appliedscheme;
}

Future register({required context}) async {
  String uid = FirebaseAuth.instance.currentUser!.uid.toString();

  await FirebaseFirestore.instance.collection("Users").doc(uid).update({
    "userId": uid,
    "aadharno": aadharNo,
    "name": name,
    "dob": dob,
    "gender": gender,
    "phoneno": phoneNo,
    "udidno": udidNo,
    "udidname": udidname,
    "disabilitytype": disbilitytype,
    "disabilitypercentage": disabilitypercentage,
    "dateissue": dataissue,
    "validupto": validupto,
    "registeration": true,
    "verification": false
  }).whenComplete(() => Fluttertoast.showToast(
      msg: "Register Succesfully",
      toastLength: Toast.LENGTH_LONG,
      fontSize: 20,
      backgroundColor: secondary,
      textColor: Colors.black));

  await FirebaseFirestore.instance.collection("Users").doc(uid).update({
    "userId": uid,
    "name": name,
    "dob": dob,
    "gender": gender,
    "phoneno": phoneNo,
    "registeration": true,
    "verification": false,
  });

  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const Home()));
}

Future schemeapply({
  required String schemename,
  required String schemeid,
}) async {
  bool checkActiveScheme = await FirebaseFirestore.instance
      .collection(
          "Users/${FirebaseAuth.instance.currentUser!.uid}/AppliedScheme")
      .where(
        "progress",
        isLessThan: 4,
      )
      .get()
      .then((value) {
    return value.docs.isEmpty;
  });

  if (checkActiveScheme) {
    var refAppicationId =
        await FirebaseFirestore.instance.collection("Application").add({
      "userId": FirebaseAuth.instance.currentUser!.uid.toString(),
      "userName": userDetail!.name,
      "schemeId": schemeid,
      "Activited": false,
      "progress": 0,
      "status": " waiting for under process",
      "phoneno": userDetail!.phoneno,
      "schemename": schemename,
      "dataofapply": DateTime.now(),
    });

    await FirebaseFirestore.instance
        .collection("Application")
        .doc(refAppicationId.id)
        .update({"Applicationid": refAppicationId.id});

    await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .collection("AppliedScheme")
        .doc(refAppicationId.id)
        .set({
      "Applicationid": refAppicationId.id,
      "status": " waiting for under process",
      "userId": FirebaseAuth.instance.currentUser!.uid.toString(),
      "userName": userDetail!.name,
      "schemeId": schemeid,
      "Activited": false,
      "progress": 0,
      "phoneno": userDetail!.phoneno,
      "schemename": schemename,
      "dataofapply": DateTime.now(),
    });
  } else {
    Fluttertoast.showToast(
        msg: "Can't apply for any scheme while being in active scheme",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        fontSize: 20,
        backgroundColor: primary,
        textColor: Colors.white);
  }
}

Future getapplication() async {
  List applicant = [];
  await FirebaseFirestore.instance
      .collection("Application")
      .get()
      .then((QuerySnapshot querysnapshot) {
    for (var doc in querysnapshot.docs) {
      applicant.add(doc.data());
    }
  });
  return applicant;
}
