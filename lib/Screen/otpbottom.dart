import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/provider/phoneauth.dart';

class OtpBottomSheet extends StatefulWidget {
  final String phoneNumber, verificationId;
  const OtpBottomSheet({
    Key? key,
    required this.phoneNumber,
    required this.verificationId,
  }) : super(key: key);

  @override
  State<OtpBottomSheet> createState() => _OtpBottomSheetState();
}

class _OtpBottomSheetState extends State<OtpBottomSheet> {
  final TextEditingController _smsCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
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
          Pinput(
              length: 6,
              controller: _smsCode,
              onCompleted: (pin) => PhoneAuth().submitOpt(
                  verificationId: widget.verificationId,
                  smsCode: _smsCode.text,
                  context: context)),
          Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 10),
            child: Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(180, 40),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: button),
                  onPressed: () => PhoneAuth().submitOpt(
                      verificationId: widget.verificationId,
                      smsCode: _smsCode.text,
                      context: context),
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
