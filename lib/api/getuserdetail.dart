import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scheme/api/checknewuser.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/model/usermodel.dart';
import 'package:scheme/provider/notifcationprovider.dart';
import 'package:scheme/provider/phoneauth.dart';

Future getUserDeatilsApi({required context}) async {
  await UserDetails().userExits(context: context);
}

class UserDetails {
  User user = FirebaseAuth.instance.currentUser!;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future userExits({required context}) async {
    String? userExit = await checkuser();
    if (userExit == "Yes") {
      await getFCM(uid: user.uid);
      await getUserDetails(context: context);
    } else {
      await PhoneAuth().logOut(context: context);
    }
  }

  Future getUserDetails({required context}) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .get()
        .then((docSnapshot) async {
      var data = docSnapshot.data();
      userDetail = UserModel.fromMap(data!);
      log(data["phoneno"]);
    });
  }
}
