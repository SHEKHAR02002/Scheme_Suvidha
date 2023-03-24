import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:scheme/data/userdata.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.high,
    playSound: true);

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
Future getFCM({required String uid}) async {
  // Get the token each time the application loads
  String? token = await FirebaseMessaging.instance.getToken();
  Future saveTokenToDatabase(String fcmToken) async {
    await FirebaseFirestore.instance
        .collection(!isagent ? "Users" : "AgentUser")
        .doc(uid)
        .update({"token": fcmToken});
  }

  // Save the initial token to the database
  await saveTokenToDatabase(token!);

  // Any time the token refreshes, store this in the database too.
  FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToDatabase);
}
