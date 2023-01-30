import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scheme/Screen/home.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/data/userdata.dart';

Future getdata() async {
  List schemedata = [];
  await FirebaseFirestore.instance
      .collection("Scheme")
      .get()
      .then((QuerySnapshot querysnapshot) async {
    for (var doc in querysnapshot.docs) {
      schemedata.add(doc.data());
    }
  });

  return schemedata;
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
