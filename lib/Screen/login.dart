import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Screen/agentlogin.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/provider/phoneauth.dart';
// import 'package:scheme/provider/phoneauth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _phoneNo = TextEditingController();
  bool loader = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
            const Text(
              "LOGIN",
              style: TextStyle(
                  fontFamily: "Zilla",
                  fontSize: 32,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Enter mobile number",
              style: TextStyle(
                  color: primary,
                  fontFamily: "Zilla",
                  fontSize: 24,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                height: 50,
                decoration: shadowdecoration,
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15),
                    prefixIcon: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          '+91',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        )),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  controller: _phoneNo,
                ),
              ),
            ),
          ],
        )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
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
                      phoneNo: _phoneNo.text,
                      context: context,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: primary,
                    minimumSize: Size(width, 50)),
                child: const Text(
                  "Request otp",
                  style: TextStyle(
                      fontFamily: "Overpass",
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                )),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (() => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AgentLogin()))),
              child: Text(
                "Login as Agent",
                style: TextStyle(
                    color: primary,
                    fontFamily: "Overpass",
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
