import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scheme/Screen/login.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/provider/phoneauth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    double? fontsize16 =
        ResponsiveValue(context, defaultValue: 16.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 12.0),
      Condition.largerThan(name: TABLET, value: 30.0)
    ]).value as double;
    double? fontsize18 =
        ResponsiveValue(context, defaultValue: 18.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 14.0),
      Condition.largerThan(name: TABLET, value: 32.0)
    ]).value as double;
    double? fontsize24 =
        ResponsiveValue(context, defaultValue: 24.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 20.0),
      Condition.largerThan(name: TABLET, value: 32.0)
    ]).value as double;
    double? btnheight =
        ResponsiveValue(context, defaultValue: 50.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 30.0),
      Condition.largerThan(name: TABLET, value: 75.0)
    ]).value as double;
    double? gap = ResponsiveValue(context, defaultValue: 0.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 0.0),
      Condition.largerThan(name: TABLET, value: 10.0)
    ]).value as double;
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
            AppLocalizations.of(context)!.enterverifycode,
            style: TextStyle(
                color: primary,
                fontFamily: "Zilla",
                fontSize: fontsize24,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: gap,
          ),
          Pinput(
              defaultPinTheme: PinTheme(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: btnheight,
                  height: btnheight,
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
          SizedBox(
            height: gap,
          ),
          InkWell(
            onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const Login()),
                (route) => false),
            child: Text(
              AppLocalizations.of(context)!.editphoneno(widget.phoneNumber),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: fontsize16,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Zilla"),
            ),
          )
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
        child: loader
            ? const CircularProgressIndicator()
            : ElevatedButton(
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
                    minimumSize: Size(width, btnheight)),
                child: Text(
                  AppLocalizations.of(context)!.submit,
                  style: TextStyle(
                      fontFamily: "Overpass",
                      fontSize: fontsize18,
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