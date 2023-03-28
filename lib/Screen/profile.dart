import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/model/usermodel.dart';
import 'package:scheme/provider/phoneauth.dart';
// import 'package:scheme/widget/applyschemedetail.dart';
import 'package:scheme/widget/editaadhar.dart';
import 'package:scheme/widget/setting/setting.dart';

class Profile extends StatefulWidget {
  final UserModel user;
  const Profile({super.key, required this.user});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    if (FirebaseAuth.instance.currentUser!.uid.isNotEmpty) {}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                    color: secondary3, borderRadius: BorderRadius.circular(20)),
                height: height / 3,
                width: width,
                child: Column(children: [
                  widget.user.image != ""
                      ? CircleAvatar(
                          radius: 45,
                          backgroundImage:
                              NetworkImage(widget.user.image.toString()))
                      : CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage(defaultPic)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.user.name!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Location",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.user.phoneno!,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  )
                ]),
              ),
              SizedBox(height: height / 8),
              GestureDetector(
                onTap: () => widget.user.registeration == true
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditAadhar(
                                  user: widget.user,
                                )))
                    : Fluttertoast.showToast(
                        msg: "You Are Not Register",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0),
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
                        "Aadhar Details",
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
                // onTap: () => Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const ApplySchemeDetail())),
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
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Setting())),
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
          ),
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
