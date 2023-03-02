import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/widget/upload.dart';

class AlertCard extends StatefulWidget {
  const AlertCard({super.key});

  @override
  State<AlertCard> createState() => _AlertCardState();
}

class _AlertCardState extends State<AlertCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children:[
        Container(
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [secondary3, primary])),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/error.svg",
                  height: 30,
                  width: 30,
                ),
                Text("REGISTER YOURSELF FIRST",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            const Text('To take advantage of the latest schemes.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: primary, elevation: 0),
                onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UploadDoument())),
                child: const Text(
                  "REGISTER",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ))
          ]),
        ),
      ),
      Positioned(
        top:10,
        right: 10,
        child: Icon(CupertinoIcons.clear,size: 20,))
      ] 
    );
  }
}
