import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scheme/model/usermodel.dart';

Future activeapplication({required UserModel applicationdetails}) async {
  await FirebaseFirestore.instance
      .collection("AgentUser")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("YourApplications")
      .doc(applicationdetails.applicationid)
      .set({
    "activatby": FirebaseAuth.instance.currentUser!.uid,
    "Applicationid": applicationdetails.applicationid,
    "userId": applicationdetails.userId,
    "aadharno": applicationdetails.aadharno,
    "name": applicationdetails.name,
    "dob": applicationdetails.dob,
    "gender": applicationdetails.gender,
    "udidno": applicationdetails.udidno,
    "udidname": applicationdetails.udidname,
    "disabilitytype": applicationdetails.disabilitytype,
    "disabilitypercentage": applicationdetails.disabilitypercentage,
    "dateissue": applicationdetails.dateissue,
    "validupto": applicationdetails.validupto,
    "registeration": true,
    "verification": false,
    "phoneno": applicationdetails.phoneno,
    "schemename": applicationdetails.applyschemename,
  });

  await FirebaseFirestore.instance
      .collection("Application")
      .doc(applicationdetails.applicationid)
      .delete();
}

applicationaccept({required UserModel applicationdetails}) async {
  await FirebaseFirestore.instance
      .collection("AgentUser")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("YourApplications")
      .doc(applicationdetails.applicationid)
      .update({"verification": true});

  await FirebaseFirestore.instance
      .collection("Users")
      .doc(applicationdetails.userId)
      .collection("AppliedScheme")
      .doc(applicationdetails.applicationid)
      .update({"verification": true});

  await FirebaseFirestore.instance
      .collection("Users")
      .doc(applicationdetails.userId)
      .update({"verification": true});

  await FirebaseFirestore.instance
      .collection("AgentUser")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("YourApplications")
      .doc(applicationdetails.applicationid)
      .delete();

  await FirebaseFirestore.instance
      .collection("AgentUser")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("History")
      .doc(applicationdetails.applicationid)
      .set({
    "activatby": FirebaseAuth.instance.currentUser!.uid,
    "Applicationid": applicationdetails.applicationid,
    "userId": applicationdetails.userId,
    "aadharno": applicationdetails.aadharno,
    "name": applicationdetails.name,
    "dob": applicationdetails.dob,
    "gender": applicationdetails.gender,
    "udidno": applicationdetails.udidno,
    "udidname": applicationdetails.udidname,
    "disabilitytype": applicationdetails.disabilitytype,
    "disabilitypercentage": applicationdetails.disabilitypercentage,
    "dateissue": applicationdetails.dateissue,
    "validupto": applicationdetails.validupto,
    "registeration": true,
    "verification": true,
    "phoneno": applicationdetails.phoneno,
    "schemename": applicationdetails.applyschemename,
  });
}
