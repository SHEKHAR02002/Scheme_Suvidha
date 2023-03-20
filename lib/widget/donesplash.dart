import 'package:flutter/material.dart';
import 'package:scheme/Screen/home.dart';
import 'package:scheme/Theme/color.dart';

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
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: ElevatedButton(
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
                    ))),
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
          ],
        ),
      ),
    );
  }
}
