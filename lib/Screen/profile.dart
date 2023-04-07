import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Screen/registrationscreens/upload.dart';
import 'package:scheme/Screen/update/update.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/model/usermodel.dart';
import 'package:scheme/provider/googletranslator.dart';
import 'package:scheme/provider/phoneauth.dart';
import 'package:scheme/widget/applyschemedetail.dart';
// import 'package:scheme/widget/applyschemedetail.dart';
import 'package:scheme/widget/setting/setting.dart';

class Profile extends StatefulWidget {
  final UserModel user;
  const Profile({super.key, required this.user});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = " ";
  call() async {
    String tempname = await TranslationService()
        .translate(targetLanguage: 'Hi', text: widget.user.name.toString());
    if (mounted) {
      setState(() {
        name = tempname;
      });
    }
  }

  @override
  void initState() {
    // name = widget.user.name.toString();
    call();
    if (FirebaseAuth.instance.currentUser!.uid.isNotEmpty) {}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          foregroundColor: Colors.black,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: secondary3,
                        borderRadius: BorderRadius.circular(20)),
                    // height: height / 3,
                    width: width,
                    child: registration
                        ? Column(children: [
                            widget.user.image != ""
                                ? CircleAvatar(
                                    radius: 45,
                                    backgroundImage: NetworkImage(
                                        widget.user.image.toString()))
                                : CircleAvatar(
                                    radius: 45,
                                    backgroundImage: NetworkImage(defaultPic)),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              turnOnGOOGleAPI
                                  ? name
                                  : widget.user.name.toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Location",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.user.phoneno!,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            )
                          ])
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              children: [
                                CircleAvatar(
                                    radius: 45,
                                    backgroundImage: NetworkImage(defaultPic)),
                                const SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(100, 20),
                                        backgroundColor: primary,
                                        elevation: 0),
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const UploadDoument())),
                                    child: const Text(
                                      "Register",
                                      style: TextStyle(
                                          fontFamily: "Zilla",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    )),
                              ],
                            ),
                          )),
                const SizedBox(height: 80),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Updateprofile(
                                user: widget.user,
                              ))),
                  child: Container(
                    decoration: shadowdecoration,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(children: [
                        Icon(
                          CupertinoIcons.pencil_ellipsis_rectangle,
                          size: 24,
                          color: primary,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Update Profile",
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
                  height: 25,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AppliedScheme())),
                  child: Container(
                    decoration: shadowdecoration,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(children: [
                        SvgPicture.asset(
                          "assets/scheme.svg",
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Scheme Details",
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
                  height: 25,
                ),
                Container(
                  decoration: shadowdecoration,
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Setting())),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(children: [
                        SvgPicture.asset(
                          "assets/setting.svg",
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Setting",
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
            )),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
            child: ElevatedButton(
                onPressed: () => PhoneAuth().logOut(context: context),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: primary,
                    minimumSize: Size(width, 50)),
                child: const Text(
                  "Logout",
                  style: TextStyle(
                      fontFamily: "Overpass",
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ))));
  }
}
