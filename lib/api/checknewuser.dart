import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/provider/notifcationprovider.dart';

Future checkuser() async {
  bool newuser = true;
  String uid = FirebaseAuth.instance.currentUser!.uid.toString();
  await FirebaseFirestore.instance
      .collection("Users")
      .doc(uid)
      .get()
      .then((docsnapshot) {
    if (docsnapshot.exists) {
      getFCM(uid: uid);
      newuser = false;
    } else {
      newuser = true;
    }
  });
  return newuser;
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
    "aadharno": aadharNo,
    "name": name,
    "dob": dob,
    "gender": gender,
    "udidno": udidNo,
    "udidname": udidname,
    "disabilitytype": disbilitytype,
    "disabilitypercentage": disabilitypercentage,
    "dateissue": dataissue,
    "validupto": validupto,
    "registeration": true,
    "verification": false,
  });
}

Future schemeapply({required String schemename}) async {
  await FirebaseFirestore.instance
      .collection("Application")
      .doc(FirebaseAuth.instance.currentUser!.uid.toString())
      .set({
    "userId": FirebaseAuth.instance.currentUser!.uid.toString(),
    "aadharno": userDetail!.aadharno,
    "name": userDetail!.name,
    "dob": userDetail!.dob,
    "gender": userDetail!.gender,
    "udidno": userDetail!.udidno,
    "udidname": userDetail!.udidname,
    "disabilitytype": userDetail!.disabilitytype,
    "disabilitypercentage": userDetail!.disabilitypercentage,
    "dateissue": userDetail!.dateissue,
    "validupto": userDetail!.validupto,
    "registeration": true,
    "verification": false,
    "phoneno": userDetail!.phoneno,
    "schemename": schemename,
    "dataofapply": DateTime.now(),
  });
}

Future update() async {
  await FirebaseFirestore.instance
      .collection("Users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update(
          {"aadharno": aadharNo, "name": name, "dob": dob, "gender": gender});
}
