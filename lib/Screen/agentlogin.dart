import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Screen/agentwidget/agentregistration.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/api/checknewuser.dart';

import 'Agent/agentbottomsheet.dart';

class AgentLogin extends StatefulWidget {
  const AgentLogin({super.key});

  @override
  State<AgentLogin> createState() => _AgentLoginState();
}

class _AgentLoginState extends State<AgentLogin> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Future singin({required String email, required String password}) async {
    // bool signComplete = false;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        if (value.user!.uid.isNotEmpty) {
          await checkuser(context: context).whenComplete(() =>
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BottomNavigator()),
                  (route) => false));
          return true;
        } else {
          return false;
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('No user found for that email.'),
        ));
        return false;
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Wrong password provided for that user.'),
        ));
        return false;
      }
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        // backgroundColor: bgcolor,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/login_svg2.svg",
                  height: height / 2,
                  width: width,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Email",
                    style: TextStyle(
                        color: primary,
                        fontFamily: "Zilla",
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
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
                    child: TextField(
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            "assets/email.svg",
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      controller: _email,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Password",
                    style: TextStyle(
                        color: primary,
                        fontFamily: "Zilla",
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
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
                    child: TextField(
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            "assets/password.svg",
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      controller: _password,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                  onPressed: () {
                    if (_email.text != "" && _password.text != "") {
                      singin(email: _email.text, password: _password.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor: primary,
                      minimumSize: Size(width, 50)),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontFamily: "Overpass",
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  )),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AgentRegistration()));
                },
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "  Don’t  have account ?",
                      style: TextStyle(fontSize: 15, color: text2)),
                  TextSpan(
                      text: "  Register",
                      style: TextStyle(fontSize: 15, color: primary))
                ])),
              )
            ],
          ),
        ));
  }
}
