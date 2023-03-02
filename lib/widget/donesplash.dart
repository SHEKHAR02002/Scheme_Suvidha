import 'package:flutter/material.dart';
import 'package:scheme/Screen/home.dart';
import 'package:scheme/Theme/color.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';
class DoneUpload extends StatefulWidget {
  const DoneUpload({super.key});

  @override
  State<DoneUpload> createState() => _DoneUploadState();
}

class _DoneUploadState extends State<DoneUpload> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      backgroundColor: bgcolor,
      duration: const Duration(seconds: 1),
      navigateRoute:
          
      const Home(),
      imageSrc: "assets/logo.png",
  
      logoSize: 300,
      pageRouteTransition: PageRouteTransition.SlideTransition,
    );
  }
}