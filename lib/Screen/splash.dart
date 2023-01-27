import 'package:flutter/material.dart';
import 'package:scheme/Screen/login.dart';
import 'package:scheme/Theme/color.dart';
import 'package:tbib_splash_screen/splash_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      backgroundColor: bgcolor,
      duration: const Duration(seconds: 1),
      navigateRoute: const Login(),
      imageSrc: "assets/logo.png",
      logoSize: 300,
    );
  }
}
