import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Screen/Agent/agenthistory.dart';
import 'package:scheme/Screen/agentwidget/resetpassword.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';

class AgentProfile extends StatefulWidget {
  const AgentProfile({super.key});

  @override
  State<AgentProfile> createState() => _AgentProfileState();
}

class _AgentProfileState extends State<AgentProfile> {
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
                  CircleAvatar(
                    radius: 45,
                    child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/scheme-suvidha-admin.appspot.com/o/miscellaneous%2Fdefalutprofile.png?alt=media&token=fbf2357d-d893-43a7-9bcc-412f454691c4",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
                  const Text(
                    "",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  )
                ]),
              ),
              SizedBox(height: height / 10),
              GestureDetector(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassword())),
                child: Container(
                  decoration: shadowdecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(children: [
                      SvgPicture.asset(
                        "assets/key.svg",
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Reset Password",
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
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AgentHistory())),
                child: Container(
                  decoration: shadowdecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(children: [
                      SvgPicture.asset(
                        "assets/watch.svg",
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "History",
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
              )
            ],
          ),
        )),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
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
