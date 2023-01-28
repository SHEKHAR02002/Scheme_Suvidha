import 'package:flutter/material.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';

Widget processingPopup({
  required BuildContext context,
  required String msg,
}) =>
    AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Lottie.asset("animations/loader.json", height: 100, width: 190),
            const SizedBox(height: 10),
            Text(msg),
          ],
        ),
      ),
    );
