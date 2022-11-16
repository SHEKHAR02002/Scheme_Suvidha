import 'dart:ffi';

import 'package:flutter/material.dart';
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
    await Future.delayed(Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Image(image: AssetImage('assets/logo.jpeg')),
              SizedBox(
                height: 30,
              ),
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
              SizedBox(
                height: 10,
              ),
              Text(
                "‘One-point solution to avail your Disability Benefits! Cause you are not disabled; you are just Differently-abled.’",
                style: TextStyle(
                  color: text1,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Overpass",
                ),
                textAlign: TextAlign.center,
              )

              // Padding(
              //   padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
              //   child: SizedBox(
              //     height: 50,
              //     child: ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //             elevation: 0,
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(12)),
              //             backgroundColor: button),
              //         onPressed: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => const Login()));
              //         },
              //         child: Text(
              //           "Continue",
              //           style: TextStyle(
              //               fontFamily: 'Overpass',
              //               fontSize: 24,
              //               fontWeight: FontWeight.w700),
              //         )),
              //   ),
              // )
            ],
          )),
        ),
      ),
    );
  }
}
