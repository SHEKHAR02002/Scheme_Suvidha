import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Dialog(
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: bgcolor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "OTP  Verification",
                style: TextStyle(
                  color: Color(
                    0xff504538,
                  ),
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Inter",
                  letterSpacing: 0.6,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Enter the OTP you received to",
                style: TextStyle(
                  color: Color(
                    0xff504538,
                  ),
                  fontSize: 20,
                  letterSpacing: 0.48,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
