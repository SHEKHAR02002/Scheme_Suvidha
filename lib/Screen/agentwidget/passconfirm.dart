import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scheme/Screen/agentwidget/agentregistration.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/data/userdata.dart';

import '../Agent/agentbottomsheet.dart';

class PassConfirm extends StatefulWidget {
  // final dynamic angetDetails;
  const PassConfirm({super.key});

  @override
  State<PassConfirm> createState() => _PassConfirmState();
}

class _PassConfirmState extends State<PassConfirm> {
  final TextEditingController _agentemail = TextEditingController(),
      _agentpassword = TextEditingController(),
      _agentconfirmpass = TextEditingController();

  Future singup({required String email, required String password}) async {
    bool signComplete = false;
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      credential.user != null
          ? await FirebaseFirestore.instance
              .collection("AgentUser")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .set({
              "userId": FirebaseAuth.instance.currentUser!.uid,
              "email": email,
              "password": password,
              "verification": false,
              "name": agentname,
              "dob": agentdob,
              "gender": agentgender,
              "occupation": agentoccupation,
              "address": agentaddress,
              "pincode": agentpincode
            }).whenComplete(() => signComplete = true)
          : null;
      return signComplete;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('The password provided is too weak.'),
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('The account already exists for that email.'),
        ));
      }
      log(e.toString());
      return signComplete;
    }
  }

  Future singin({required String email, required String password}) async {
    bool signComplete = false;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(() => signComplete = true);
      return signComplete;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('No user found for that email.'),
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Wrong password provided for that user.'),
        ));
      }
      return signComplete;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const AgentRegistration()),
                  (route) => false);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: const Text(
          "Create Account",
          style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w400,
              fontFamily: "Zilla"),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/logo.png",
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "Please enter your email address \n and create password",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: text2),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 45,
                  decoration: shadowdecoration,
                  child: TextField(
                    // keyboardType: TextInputType.number,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      hintText: "Email ID",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    controller: _agentemail,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 45,
                  decoration: shadowdecoration,
                  child: TextField(
                    // keyboardType: TextInputType.number,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      hintText: "New Password",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    controller: _agentpassword,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 45,
                  decoration: shadowdecoration,
                  child: TextField(
                    // keyboardType: TextInputType.number,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      hintText: "Confirm Password",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    controller: _agentconfirmpass,
                  ),
                ),
                const SizedBox(height: 80),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_agentemail.text != "" &&
                            _agentpassword.text != "") {
                          if (_agentpassword.text == _agentconfirmpass.text) {
                            agentemailid = _agentemail.text;
                            agentpassword = _agentpassword.text;
                          } else {
                            print("Your Password Not Match");
                          }
                        }
                      });
                      singup(
                              email: _agentemail.text,
                              password: _agentpassword.text)
                          .whenComplete(() => Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const BottomNavigator()),
                              (route) => false));
                    },

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const PassConfirm())),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: primary,
                        minimumSize: Size(width, 50)),
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                          fontFamily: "Overpass",
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
