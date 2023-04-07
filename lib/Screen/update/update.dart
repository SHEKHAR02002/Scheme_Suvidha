import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scheme/Screen/update/editaadhar.dart';
import 'package:scheme/Screen/update/editudid.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/model/usermodel.dart';

class Updateprofile extends StatelessWidget {
  final UserModel user;
  const Updateprofile({super.key, required this.user});

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
          "Update Profile",
          style: TextStyle(
              color: black,
              fontFamily: "Zilla",
              fontSize: 24,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            InkWell(
              onTap: () => registration
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditAadhar(user: user)))
                  : Fluttertoast.showToast(
                      msg: "User Not Register",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: primary,
                      textColor: Colors.white,
                      fontSize: 20.0),
              child: Container(
                decoration: shadowdecoration,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(children: [
                    SvgPicture.asset(
                      "assets/personalcard.svg",
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Update Aadhar Details",
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
                    builder: (context) => Editudid(
                      user: user,
                    ),
                  )),
              child: Container(
                decoration: shadowdecoration,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(children: [
                    SvgPicture.asset(
                      "assets/udid.svg",
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Update UDID Details",
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
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(children: [
                  Icon(
                    CupertinoIcons.doc_person_fill,
                    size: 24,
                    color: primary,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Update Documents",
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
          ],
        ),
      ),
    );
  }
}
