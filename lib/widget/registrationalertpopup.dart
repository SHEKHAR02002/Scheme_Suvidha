import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/widget/upload.dart';

class RegistrationAlertPopup extends StatefulWidget {
  const RegistrationAlertPopup({super.key});

  @override
  State<RegistrationAlertPopup> createState() => _RegistrationAlertPopupState();
}

class _RegistrationAlertPopupState extends State<RegistrationAlertPopup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Registration Alert !',
        style: TextStyle(
            fontSize: 26, fontFamily: "Zilla", fontWeight: FontWeight.w400),
      ),
      content: const Text(
        'Complete Your Registration',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: Text(
            'Skip',
            style: TextStyle(color: text2),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UploadDoument()));
          },
          child: Text(
            'Register',
            style: TextStyle(color: primary, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
