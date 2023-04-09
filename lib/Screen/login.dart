// import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:just_audio/just_audio.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scheme/Screen/agentlogin.dart';
import 'package:scheme/Screen/knowagent.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/provider/phoneauth.dart';
import 'package:scheme/widget/languagedropdown.dart';
// import 'package:scheme/provider/phoneauth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _phoneNo = TextEditingController();
  bool isplaying = false;
  final player = AudioPlayer();
  String _country = "+91";
  Future callApi() async {
    await player.setUrl(
        'https://firebasestorage.googleapis.com/v0/b/scheme-suvidha-admin.appspot.com/o/WhatsApp%20Audio%202023-04-10%20at%2012.23.45%20AM.mp3?alt=media&token=196b6d9d-6c65-4caa-9a57-368cd2705c0a');
  }

  @override
  void initState() {
    // callApi();
    super.initState();
  }

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
    double? fontsize32 =
        ResponsiveValue(context, defaultValue: 32.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 28.0),
      Condition.largerThan(name: TABLET, value: 50.0)
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
      appBar: AppBar(
        leading: IconButton(
            onPressed: () async {
              setState(() {
                isplaying = !isplaying;
              });
              if (isplaying) {
                player.loopMode;
                await player.setUrl(
                    "https://firebasestorage.googleapis.com/v0/b/scheme-suvidha-admin.appspot.com/o/appaudio.mp3?alt=media&token=6433806c-36e5-4c30-b93a-6e9784be8529");
                await player.play();
              } else {
                await player.pause();
              }
            },
            icon: isplaying
                ? Icon(Icons.volume_up_rounded, size: 30, color: primary)
                : Icon(Icons.volume_off_rounded, size: 30, color: primary)),
        backgroundColor: bgcolor,
        elevation: 0,
        actions: const [
          LanguageDropdown(),
          SizedBox(
            width: 20,
          )
        ],
      ),
      // backgroundColor: bgcolor,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SvgPicture.asset(
              "assets/login_svg.svg",
              height: height / 2,
              width: width,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)!.login,
              style: TextStyle(
                  fontFamily: "Zilla",
                  fontSize: fontsize32,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppLocalizations.of(context)!.mobileno,
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
            Container(
              decoration: shadowdecoration,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: btnheight,
              child: IntlPhoneField(
                dropdownTextStyle: TextStyle(
                    fontSize: fontsize16, fontWeight: FontWeight.w400),
                style: TextStyle(
                    fontSize: fontsize16, fontWeight: FontWeight.w400),
                initialCountryCode: "IN",
                invalidNumberMessage:
                    AppLocalizations.of(context)!.invalidNumberMessage,
                showDropdownIcon: false,
                showCountryFlag: false,
                decoration: InputDecoration(
                  counterText: "",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5)),
                ),
                controller: _phoneNo,
                onChanged: (value) {
                  if (_phoneNo.text.length == 10) {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  }
                },
                onCountryChanged: (country) {
                  setState(() {
                    _country = country.code;
                  });
                },
              ),
            ),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const KnowAgent())),
        backgroundColor: primary,
        child: const Icon(Icons.person),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () async {
                  if (_phoneNo.text.length == 10) {
                    setState(() {
                      loader = true;
                      phoneNo = _phoneNo.text.toString();
                    });
                    Future.delayed(const Duration(seconds: 30), () {
                      if (mounted) {
                        setState(() {
                          loader = false;
                        });
                      }
                    });
                    loader = await PhoneAuth().sendOtp(
                      phoneNo: _country + _phoneNo.text,
                      context: context,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: primary,
                    minimumSize: Size(width, btnheight)),
                child: Text(
                  AppLocalizations.of(context)!.requestotp,
                  style: TextStyle(
                      fontFamily: "Overpass",
                      fontSize: fontsize18,
                      fontWeight: FontWeight.w700),
                )),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (() => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AgentLogin()))),
              child: Text(
                AppLocalizations.of(context)!.loginagent,
                style: TextStyle(
                    color: primary,
                    fontFamily: "Overpass",
                    fontSize: fontsize16,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
