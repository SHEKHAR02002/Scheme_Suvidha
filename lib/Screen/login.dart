import 'package:flutter/material.dart';
import 'package:scheme/Screen/home.dart';
import 'package:scheme/Theme/color.dart';
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
                const Text("Login Page"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 40, 35, 0),
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor: primary),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()));
                        },
                        // PhoneAuth()
                        //     .sendOtp(phoneNo: _phoneNo.text, context: context),
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
            )),
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
