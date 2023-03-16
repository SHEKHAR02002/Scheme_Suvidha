import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:scheme/api/checknewuser.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/model/usermodel.dart';
import 'package:scheme/provider/notifcationprovider.dart';
import 'package:scheme/provider/phoneauth.dart';

Future getUserDeatilsApi({required context}) async {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              enableLights: false,
              channel.id,
              channel.name,
              playSound: true,
              icon: '@mipmap/ic_launcher',
            ),
          ));
    }
  });
  await UserDetails().userExits(context: context);
}

class UserDetails {
  User user = FirebaseAuth.instance.currentUser!;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future userExits({required context}) async {
    if (!await checkuser()) {
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

Future agentlogin({required String email, required String password}) async {
  bool status = false;
  try {
    await FirebaseFirestore.instance
        .collection("AgentUser")
        .where("agentEmail", isEqualTo: email.toString())
        .where("agentPassword", isEqualTo: password)
        .get()
        .then((value) => {
              if (value.size == 1) {status = true} else {status = false}
            });

    return status;
  } catch (e) {
    print(e.toString());
    return false;
  }
}
