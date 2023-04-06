import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/model/usermodel.dart';

Future activeapplication({required UserModel applicationdetails}) async {
  await FirebaseFirestore.instance
      .doc(
          "Users/${applicationdetails.userId}/AppliedScheme/${applicationdetails.applicationid}")
      .update({
    "progress": 1,
    "status": "The Application is under process by ${agentDetails!.name}"
  });
  await FirebaseFirestore.instance
      .doc(
          "Users/${applicationdetails.userId}/AppliedScheme/${applicationdetails.applicationid}")
      .get()
      .then((DocumentSnapshot<Map<String, dynamic>> value) async =>
          await FirebaseFirestore.instance
              .collection("AgentUser")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("YourApplications")
              .doc(applicationdetails.applicationid)
              .set(value.data()!));

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

Future verifyUser(
    {required bool accepted, String msg = "", required String userId}) async {
  if (accepted) {
    await FirebaseFirestore.instance.doc("Users/$userId").update(
        {"verification": true, "msg": "User documents have been verified"});
  } else {
    await FirebaseFirestore.instance
        .doc("Users/$userId")
        .update({"registeration": false, "msg": msg});
  }
}

Future agentbyregistration() async {
  var details = await FirebaseFirestore.instance
      .collection("AgentUser")
      .doc(FirebaseAuth.instance.currentUser!.uid.toString())
      .collection("FormFilled")
      .add({
    "userId": FirebaseAuth.instance.currentUser!.uid.toString(),
    "image": agentbyimage,
    "aadharno": aadharNo,
    "name": name,
    "dob": dob,
    "gender": gender,
    "aadharimage": agentbyaadharimage,
    "phoneno": phoneNo,
    "udidimage": agentbyudidimage,
    "udidno": udidNo,
    "disabilitytype": disbilitytype,
    "disabilitypercentage": disabilitypercentage,
    "dateissue": dataissue,
    "validupto": validupto,
    "registeration": true,
    "verification": false,
    "msg": "",
    "addressproof": agentbyaddressprooflink,
    "ageproof": agentbyageprooflink,
    "domacaile": agentbydomacilelink,
    "income": agentbyincomecertilink,
    "lastyear": agentbylastyearlink,
    "parentid": agentbyparentidlink,
    "addressprooftype": addresproftype,
    "ageprooftype": ageprooftype
  });
  FirebaseFirestore.instance
      .collection("AgentUser")
      .doc(FirebaseAuth.instance.currentUser!.uid.toString())
      .collection("FormFilled")
      .doc(details.id)
      .update({"applicationid": details.id});
}
