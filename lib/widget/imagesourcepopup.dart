import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';

class ImageSourcePopup extends StatefulWidget {
  const ImageSourcePopup({super.key});

  @override
  State<ImageSourcePopup> createState() => _ImageSourcePopupState();
}

class _ImageSourcePopupState extends State<ImageSourcePopup> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 250),
      child: AlertDialog(
        title: Text(
          'Select Image',
          style: TextStyle(
              fontSize: 26,
              fontFamily: "Zilla",
              fontWeight: FontWeight.w400,
              color: primary),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: const [
                Icon(
                  Icons.camera_alt_outlined,
                  size: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Camera",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                )
              ],
            ),
            SizedBox(
              width: width / 5,
            ),
            Column(
              children: const [
                Icon(
                  CupertinoIcons.photo,
                  size: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Gallery",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
