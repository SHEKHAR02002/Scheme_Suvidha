import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';

class Permission extends StatefulWidget {
  const Permission({super.key});

  @override
  State<Permission> createState() => _PermissionState();
}

class _PermissionState extends State<Permission> {
  bool notificationpermission = true;
  bool emailpermission = true;
  bool schemealert = true;
  bool campalert = true;
  bool schemerenewalalert = true;

  update() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .update({
      "pushpermission": notificationpermission,
      "emailpermission": emailpermission,
      "schmerenewal": schemerenewalalert,
      "newschemalert": schemealert,
      "newcampalert": campalert,
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
            "Permissions",
            style: TextStyle(
                color: black,
                fontFamily: "Zilla",
                fontSize: 24,
                fontWeight: FontWeight.w400),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Container(
                height: 50,
                decoration: shadowdecoration,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    children: [
                      Text(
                        "Push Notification",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: primary),
                      ),
                      const Spacer(),
                      FlutterSwitch(
                        value: notificationpermission,
                        padding: 0,
                        height: 24,
                        width: 40,
                        activeColor: const Color(
                          0x996a8caf,
                        ),
                        activeToggleColor: primary,
                        inactiveColor: Colors.grey,
                        onToggle: ((value) {
                          setState(() {
                            notificationpermission = value;
                          });
                        }),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              Container(
                height: 50,
                decoration:shadowdecoration,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    children: [
                      Text(
                        "Email Notification",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: primary),
                      ),
                      const Spacer(),
                      FlutterSwitch(
                        value: emailpermission,
                        padding: 0,
                        height: 24,
                        width: 40,
                        activeColor: const Color(
                          0x996a8caf,
                        ),
                        activeToggleColor: primary,
                        inactiveColor: Colors.grey,
                        onToggle: ((value) {
                          setState(() {
                            emailpermission = value;
                          });
                        }),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              Container(
                height: 50,
                decoration: shadowdecoration,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    children: [
                      Text(
                        "Scheme Renewal Alert",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: primary),
                      ),
                      const Spacer(),
                      FlutterSwitch(
                        value: schemerenewalalert,
                        padding: 0,
                        height: 24,
                        width: 40,
                        activeColor: const Color(
                          0x996a8caf,
                        ),
                        activeToggleColor: primary,
                        inactiveColor: Colors.grey,
                        onToggle: ((value) {
                          setState(() {
                            schemerenewalalert = value;
                          });
                        }),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              Container(
                height: 50,
                decoration: shadowdecoration,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    children: [
                      Text(
                        "New Scheme Alert",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: primary),
                      ),
                      const Spacer(),
                      FlutterSwitch(
                        value: schemealert,
                        padding: 0,
                        height: 24,
                        width: 40,
                        activeColor: const Color(
                          0x996a8caf,
                        ),
                        activeToggleColor: primary,
                        inactiveColor: Colors.grey,
                        onToggle: ((value) {
                          setState(() {
                            schemealert = value;
                          });
                        }),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              Container(
                height: 50,
                decoration: shadowdecoration,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    children: [
                      Text(
                        "New Camps Alert",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: primary),
                      ),
                      const Spacer(),
                      FlutterSwitch(
                        value: campalert,
                        padding: 0,
                        height: 24,
                        width: 40,
                        activeColor: const Color(
                          0x996a8caf,
                        ),
                        activeToggleColor: primary,
                        inactiveColor: Colors.grey,
                        onToggle: ((value) {
                          setState(() {
                            campalert = value;
                          });
                        }),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
            child: ElevatedButton(
                onPressed: () => update(),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: primary,
                    minimumSize: Size(width, 50)),
                child: const Text(
                  "Save",
                  style: TextStyle(
                      fontFamily: "Overpass",
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ))));
  }
}
