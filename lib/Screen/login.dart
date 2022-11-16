import 'package:flutter/material.dart';
import 'package:scheme/Screen/home.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/popup/opt.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Image(image: AssetImage('assets/image1.png')),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Login",
                style: TextStyle(
                    color: text1,
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    fontFamily: "Overpass"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Enter Your Mobile Number.",
                style: TextStyle(
                  color: text1,
                  fontFamily: "Overpass",
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.52,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                " Please enter 10 digit mobile no\n You get otp for verification",
                style: TextStyle(
                  color: text2,
                  fontFamily: "Overpass",
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: textfiled,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  hintText: '1234-5678-123',
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: button),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: ((context) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "OTP Verification",
                                        style: TextStyle(
                                          color: text1,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "Inter",
                                          letterSpacing: 0.6,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Enter the OTP you received",
                                        style: TextStyle(
                                          color: text2,
                                          fontSize: 20,
                                          letterSpacing: 0.48,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          _textFieldOTP(
                                              first: true, last: false),
                                          Spacer(),
                                          _textFieldOTP(
                                              first: false, last: false),
                                          Spacer(),
                                          _textFieldOTP(
                                              first: false, last: false),
                                          Spacer(),
                                          _textFieldOTP(
                                              first: false, last: true),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Center(
                                        child: SizedBox(
                                          height: 50,
                                          width: 200,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  backgroundColor: button),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const Home()));
                                              },
                                              child: Text(
                                                "Verify",
                                                style: TextStyle(
                                                    fontFamily: 'Overpass',
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                )));
                      },
                      // onPressed: () {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => const Home()));
                      // },
                      // onPressed: () => showDialog(
                      //     context: context, builder: (context) => OtpScreen()),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            fontFamily: 'Overpass',
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP({required bool first, last}) {
    return Container(
      height: 70,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.black12),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: hcontainer),
                borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
    );
  }
}
