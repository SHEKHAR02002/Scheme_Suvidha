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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("animations/done.json", height: 200, width: 290),
            const SizedBox(height: 20),
            const Text(
              "Scheme application pending...",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Zilla"),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Keep checking your status",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                fontFamily: "Zilla",
                color: Color(
                  0xff3c3c3b,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ElevatedButton(
              onPressed: () {},

              // upload(),
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  backgroundColor: primary,
                  minimumSize: Size(width, 50)),
              child: const Text(
                "Search other schemes ",
                style: TextStyle(
                    fontFamily: "Overpass",
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              )),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
                (route) => false),
            child: const Text(
              "Go to Home",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          )
        ]),
      ),
    );
  }
}
