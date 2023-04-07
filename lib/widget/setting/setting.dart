import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/widget/setting/contact.dart';
import 'package:scheme/widget/setting/help.dart';
import 'package:scheme/widget/setting/permission.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  Future<void> _launchInBrowser() async {
    final Uri url0 =
        Uri.parse("https://scheme-suvidha-landing-page.vercel.app/AboutUs");

    if (!await launchUrl(
      url0,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: black,
          ),
        ),
        title: Text(
          "Setting",
          style: TextStyle(
              color: black,
              fontFamily: "Zilla",
              fontSize: 24,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Container(
              decoration: shadowdecoration,
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Permission())),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(children: [
                    SvgPicture.asset(
                      "assets/notification.svg",
                      color: primary,
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Permissions",
                      style: TextStyle(
                          color: primary,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      "assets/right_arrow.svg",
                      height: 25,
                      width: 25,
                      color: primary,
                    ),
                  ]),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              decoration: shadowdecoration,
              child: InkWell(
                onTap: () => _launchInBrowser(),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(children: [
                    SvgPicture.asset(
                      "assets/about.svg",
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "About Us",
                      style: TextStyle(
                          color: primary,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      "assets/right_arrow.svg",
                      height: 25,
                      width: 25,
                      color: primary,
                    ),
                  ]),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              decoration: shadowdecoration,
              child: InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ContactUs())),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(children: [
                    SvgPicture.asset(
                      "assets/contact.svg",
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Contact Us",
                      style: TextStyle(
                          color: primary,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      "assets/right_arrow.svg",
                      height: 25,
                      width: 25,
                      color: primary,
                    ),
                  ]),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              decoration: shadowdecoration,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => const Help())));
                },
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(children: [
                    SvgPicture.asset(
                      "assets/help.svg",
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Help",
                      style: TextStyle(
                          color: primary,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      "assets/right_arrow.svg",
                      height: 25,
                      width: 25,
                      color: primary,
                    ),
                  ]),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
