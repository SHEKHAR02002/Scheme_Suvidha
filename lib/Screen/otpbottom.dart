import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  bool loader = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SvgPicture.asset(
            "assets/login_svg2.svg",
            height: height / 2,
            width: width,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Enter verification code",
            style: TextStyle(
                color: primary,
                fontFamily: "Zilla",
                fontSize: 24,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          Pinput(
              defaultPinTheme: PinTheme(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 40,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Color(
                              0x3f000000,
                            ), //New
                            blurRadius: 1.0,
                            offset: Offset(0, 0))
                      ],
                      // border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10))),
              length: 6,
              controller: _smsCode,
              onCompleted: (pin) => PhoneAuth().submitOpt(
                  phoneNo: widget.phoneNumber,
                  verificationId: widget.verificationId,
                  smsCode: _smsCode.text,
                  context: context)),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "click here to edit phone number",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, fontFamily: "Zilla"),
          )
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
        child: ElevatedButton(
            onPressed: () async {
              if (_smsCode.text.length == 6) {
                setState(() {
                  loader = true;
                });
                Future.delayed(const Duration(seconds: 30), () {
                  if (mounted) {
                    setState(() {
                      loader = false;
                    });
                  }
                });
                PhoneAuth().submitOpt(
                    phoneNo: widget.phoneNumber,
                    verificationId: widget.verificationId,
                    smsCode: _smsCode.text,
                    context: context);
              }
            },
            // =>Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpBottomSheet())),
            style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor: primary,
                minimumSize: Size(width, 50)),
            child: const Text(
              "Submit",
              style: TextStyle(
                  fontFamily: "Overpass",
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            )),
      ),
    );
  }
}

// Pinput(
//               length: 6,
//               controller: _smsCode,
//               onCompleted: (pin) => PhoneAuth().submitOpt(
//                   verificationId: widget.verificationId,
//                   smsCode: _smsCode.text,
//                   context: context)),