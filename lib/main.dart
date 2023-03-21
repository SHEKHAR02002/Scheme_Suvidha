import 'dart:developer';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:scheme/Screen/splash.dart';
import 'package:scheme/api/getuserdetail.dart';
import 'package:scheme/firebase_options.dart';
import 'package:scheme/provider/notifcationprovider.dart';
import 'Theme/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<

          /// ```

          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  FirebaseMessaging.instance.setAutoInitEnabled(true);
  FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: false,
  );

  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  runApp(MaterialApp(
    title: 'Scheme',
    theme: ThemeData(
      fontFamily: "Overpass",
      scaffoldBackgroundColor: bgcolor,
      primaryColor: primary,
      // colorScheme: ColorScheme(background: bgcolor),
    ),
    home: const Main(),
  ));
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  Future callApi() async {
    if (FirebaseAuth.instance.currentUser != null) {
      await getUserDeatilsApi(context: context);
      log("working${FirebaseAuth.instance.currentUser!.uid}");
      // await checkwhichUser(uid: FirebaseAuth.instance.currentUser!.uid);
    }
  }

  @override
  void initState() {
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Splash();
  }
}
