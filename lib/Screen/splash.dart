import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scheme/Screen/Agent/agentbottomsheet.dart';
import 'package:scheme/Screen/home.dart';
import 'package:scheme/Screen/login.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/api/getuserdetail.dart';
import 'package:scheme/data/userdata.dart';
import 'package:tbib_splash_screen/splash_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool loader = false, newUser = true;
  Future callApi() async {
    if (FirebaseAuth.instance.currentUser != null) {
      await getUserDeatilsApi(context: context).whenComplete(() => setState(() {
            loader = true;
            newUser = false;
          }));

      // await checkwhichUser(uid: FirebaseAuth.instance.currentUser!.uid);
    } else {
      setState(() {
        newUser = true;
        loader = true;
      });
    }
  }

  @override
  void initState() {
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      backgroundColor: bgcolor,
      navigateWhere: loader,
      duration: const Duration(seconds: 1),
      navigateRoute: newUser
          ? const Login()
          : !isagent
              ? const Home()
              : const BottomNavigator(),
      imageSrc: "assets/splashlogo.png",
      logoSize: 300,
      pageRouteTransition: PageRouteTransition.SlideTransition,
    );
  }
}
