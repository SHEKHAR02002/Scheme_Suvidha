import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/api/getuserdetail.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/provider/notifcationprovider.dart';

Future<String> checkuser({required BuildContext context}) async {
  String newUser = "";

  String uid = FirebaseAuth.instance.currentUser!.uid;

  await FirebaseFirestore.instance
      .collection("Users")
      .doc(uid)
      .get()
      .then((docSnapshot) async {
    if (docSnapshot.exists) {
      await getFCM(uid: uid).whenComplete(() async =>
          await UserDetails().getUserDetails(docSnapshot: docSnapshot));
      newUser = "Users";
    } else {
      newUser = "";
    }
  });
  if (newUser != "Users") {
    newUser = await agentCheckLogin() == true ? "AgentUser" : "";
  }
  return newUser;
}

Future<bool> agentCheckLogin() async {
  bool agent = false;
  String uid = FirebaseAuth.instance.currentUser!.uid;
  await FirebaseFirestore.instance
      .collection("AgentUser")
      .doc(uid)
      .get()
      .then((docSnapshot) async => {
            if (docSnapshot.exists)
              {
                isagent = true,
                await getFCM(uid: uid).whenComplete(
                    () async => getAgentDetails(doc: docSnapshot)),
                agent = true
              }
          });
  return agent;
}

Future newuser({required String phoneno}) async {
  String uid = FirebaseAuth.instance.currentUser!.uid.toString();
  await FirebaseFirestore.instance.collection("Users").doc(uid).set({
    "userId": uid,
    "aadharno": "",
    "name": "",
    "dob": "",
    "gender": "",
    "phoneno": phoneno,
    "udidno": "",
    "udidname": "",
    "disabilitytype": "",
    "disabilitypercentage": "",
    "dateissue": "",
    "validupto": "",
    "aadharimage": "",
    "token": "",
    "udidimage": "",
    "image": "",
    "registeration": false,
    "verification": false,
    "pushpermission": false,
    "schmerenewal": false,
    "newschemalert": false,
    "newcampalert": false,
  });
  await getFCM(uid: uid);
}

Future userdataupload() async {
  await FirebaseFirestore.instance
      .collection("Users")
      .doc(FirebaseAuth.instance.currentUser!.uid.toString())
      .update({
    "userId": FirebaseAuth.instance.currentUser!.uid.toString(),
    "image": image,
    "aadharno": aadharNo,
    "name": name,
    "dob": dob,
    "gender": gender,
    "aadharimage": aadharimage,
    "udidimage": udidimage,
    "udidno": udidNo,
    "disabilitytype": disbilitytype,
    "disabilitypercentage": disabilitypercentage,
    "dateissue": dataissue,
    "validupto": validupto,
    "registeration": true,
    "verification": false,
    "msg": "",
    "addressproof": addressprooflink,
    "ageproof": ageprooflink,
    "domacaile": domacilelink,
    "income": incomecertilink,
    "lastyear": lastyearlink,
    "parentid": parentidlink,
    "addressprooftype": addresproftype,
    "ageprooftype": ageprooftype
  });
}

Future update() async {
  await FirebaseFirestore.instance
      .collection("Users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update(
          {"aadharno": aadharNo, "name": name, "dob": dob, "gender": gender});

  Fluttertoast.showToast(
      msg: "Aadhar Detail Update",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: primary,
      textColor: Colors.white,
      fontSize: 20.0);
}

Future updateudid() async {
  await FirebaseFirestore.instance
      .collection("Users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update({
    "udidno": udidNo,
    "disabilitytype": disbilitytype,
    "disabilitypercentage": disabilitypercentage,
    "dateissue": dataissue,
    "validupto": validupto
  });
  Fluttertoast.showToast(
      msg: "UDID Detail Update",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: primary,
      textColor: Colors.white,
      fontSize: 20.0);
}
