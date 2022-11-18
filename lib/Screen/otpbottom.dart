import 'package:flutter/material.dart';
import 'package:scheme/Screen/home.dart';
import 'package:scheme/Theme/color.dart';
// import 'package:scheme/provider/phoneauth.dart';

class OtpBottomSheet extends StatefulWidget {
  final String? phoneNumber, verificationId;
  const OtpBottomSheet({
    this.phoneNumber,
    this.verificationId,
    Key? key,
  }) : super(key: key);

  @override
  State<OtpBottomSheet> createState() => _OtpBottomSheetState();
}

class _OtpBottomSheetState extends State<OtpBottomSheet> {
  // final Login widget;
  String smsCode = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "OTP Verification",
            style: TextStyle(
              color: text1,
              fontSize: 30,
              fontWeight: FontWeight.w700,
              fontFamily: "Inter",
              letterSpacing: 0.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Enter the OTP you received",
            style: TextStyle(
              color: text2,
              fontSize: 20,
              letterSpacing: 0.48,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // Pinput(
          //     length: 6,
          //     onChanged: ((value) => smsCode = value),
          //     onCompleted: (pin) => PhoneAuth().submitOpt(
          //         verificationId: "${widget.verificationId}",
          //         smsCode: smsCode,
          //         context: context)),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: button),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                  child: const Text(
                    "Verify",
                    style: TextStyle(
                        fontFamily: 'Overpass',
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
