import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scheme/Screen/home.dart';
import 'package:scheme/Screen/login.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    FirebaseAuth auth = FirebaseAuth.instance;
    return AnimatedSplashScreen(
        duration: 2500,
        splash: SizedBox(
          height: 30,
          width: width - 1,
        ),
        splashTransition: SplashTransition.fadeTransition,
        // pageTransitionType: PageTransitionType.fade,
        nextScreen: auth.currentUser == null ? const Login() : const Home());
  }
}
