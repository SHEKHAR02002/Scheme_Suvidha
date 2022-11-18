import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:scheme/Screen/login.dart';
import 'package:scheme/Theme/color.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    navigatetohome();
  }

  void navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AnimatedSplashScreen(
        duration: 2500,
        splash: SizedBox(
            child: Column(
          children: [
            const Image(image: AssetImage('assets/logo.jpeg')),
            Text(
              'Welocome  to Disability scheme Suvidha',
              style: TextStyle(
                color: text1,
                fontSize: 26,
                fontWeight: FontWeight.w700,
                fontFamily: "Overpass",
              ),
              textAlign: TextAlign.center,
            ),
          ],
        )),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        nextScreen: const Login());
  }
}
