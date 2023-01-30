import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/widget/setting/permission.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
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
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                // border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                      color: Color(
                        0x3f000000,
                      ), //New
                      blurRadius: 1.0,
                      offset: Offset(0, 0))
                ],
              ),
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Permission())),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(children: [
                    SvgPicture.asset(
                      "assets/notification.svg",
                      color: primary,
                      height: 30,
                      width: 30,
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
                      height: 30,
                      width: 30,
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
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                // border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                      color: Color(
                        0x3f000000,
                      ), //New
                      blurRadius: 1.0,
                      offset: Offset(0, 0))
                ],
              ),
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(children: [
                    SvgPicture.asset(
                      "assets/about.svg",
                      height: 30,
                      width: 30,
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
                      height: 30,
                      width: 30,
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
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                // border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                      color: Color(
                        0x3f000000,
                      ), //New
                      blurRadius: 1.0,
                      offset: Offset(0, 0))
                ],
              ),
              child: InkWell(
                onTap: () => {},
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(children: [
                    SvgPicture.asset(
                      "assets/contact.svg",
                      height: 30,
                      width: 30,
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
                      height: 30,
                      width: 30,
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
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                // border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                      color: Color(
                        0x3f000000,
                      ), //New
                      blurRadius: 1.0,
                      offset: Offset(0, 0))
                ],
              ),
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(children: [
                    SvgPicture.asset(
                      "assets/help.svg",
                      height: 30,
                      width: 30,
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
                      height: 30,
                      width: 30,
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
