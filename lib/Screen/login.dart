import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Theme/color.dart';
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
              "assets/login1.svg",
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.grey.shade300, //New
                  //       blurRadius: 8.0,
                  //       offset: const Offset(1, 3))
                  // ],
                ),
                child: TextField(
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
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
                // =>Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpBottomSheet())),
                style: ElevatedButton.styleFrom(
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
            Text(
              "Login as Agent",
              style: TextStyle(
                  color: primary,
                  fontFamily: "Overpass",
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }

//   Widget _textFieldOTP({required bool first, last}) {
//     return SizedBox(
//       height: 70,
//       child: AspectRatio(
//         aspectRatio: 1.0,
//         child: TextField(
//           autofocus: true,
//           onChanged: (value) {
//             if (value.length == 1 && last == false) {
//               FocusScope.of(context).nextFocus();
//             }
//             if (value.isEmpty && first == false) {
//               FocusScope.of(context).previousFocus();
//             }
//           },
//           showCursor: false,
//           readOnly: false,
//           textAlign: TextAlign.center,
//           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
//           keyboardType: TextInputType.number,
//           maxLength: 1,
//           decoration: InputDecoration(
//             counter: const Offstage(),
//             enabledBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(width: 1, color: Colors.black12),
//                 borderRadius: BorderRadius.circular(8)),
//             focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(width: 1, color: hcontainer),
//                 borderRadius: BorderRadius.circular(8)),
//           ),
//         ),
//       ),
//     );
//   }
}

// PhoneAuth()
//     .sendOtp(phoneNo: _phoneNo.text, context: context),
