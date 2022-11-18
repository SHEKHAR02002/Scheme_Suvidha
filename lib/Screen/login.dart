import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/provider/phoneauth.dart';
// import 'package:scheme/provider/phoneauth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _phoneNo = TextEditingController();
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Image(image: AssetImage('assets/image1.png')),
              ),
              const SizedBox(
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
              const SizedBox(
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
              const SizedBox(
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
              const SizedBox(
                height: 30,
              ),
              TextField(
                inputFormatters: [LengthLimitingTextInputFormatter(10)],
                controller: _phoneNo,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: textfiled,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  hintText: 'Enter Your Phone Number',
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 40, 35, 0),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: button),
                      onPressed: () => PhoneAuth()
                          .sendOtp(phoneNo: _phoneNo.text, context: context),
                      child: const Text(
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
