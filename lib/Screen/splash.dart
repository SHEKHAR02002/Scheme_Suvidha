import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scheme/Screen/Agent/agentbottomsheet.dart';
import 'package:scheme/Screen/home.dart';
import 'package:scheme/Screen/login.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/api/getuserdetail.dart';
import 'package:tbib_splash_screen/splash_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool loader = false, checkUser = true;

  Future callApi() async {
    FirebaseAuth.instance.currentUser != null
        ? await getUserDeatilsApi(context: context)
        : null;
    FirebaseAuth.instance.currentUser != null
        ? checkUser =
            await checkwhichUser(uid: FirebaseAuth.instance.currentUser!.uid)
        : null;
  }

  @override
  void initState() {
    callApi()
        .whenComplete(() => mounted ? setState(() => loader = true) : null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      backgroundColor: bgcolor,
      navigateWhere: loader,
      duration: const Duration(seconds: 1),
      navigateRoute: FirebaseAuth.instance.currentUser == null
          ? const Login()
          : checkUser
              ? const Home()
              : const BottomNavigator(),
      imageSrc: "assets/logo.png",
      logoSize: 300,
      pageRouteTransition: PageRouteTransition.SlideTransition,
    );
  }
}

Future<bool> checkwhichUser({required String uid}) async {
  // log(FirebaseAuth.instance.currentUser);
  return await FirebaseFirestore.instance.doc("Users/$uid").get().then((value) {
    log(value.exists.toString());
    return value.exists;
  });
}
