import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scheme/Screen/home.dart';
import 'package:scheme/Screen/login.dart';
import 'package:scheme/Screen/otpbottom.dart';

class PhoneAuth {
  FirebaseAuth auth = FirebaseAuth.instance;
  sendOtp({required String phoneNo, required BuildContext context}) async {
    await auth.verifyPhoneNumber(
      phoneNumber: "+91$phoneNo",
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) =>
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0))),
              enableDrag: false,
              isScrollControlled: true,
              context: context,
              builder: (context) => Material(
                    child: OtpBottomSheet(
                      phoneNumber: phoneNo,
                      verificationId: verificationId,
                    ),
                  )),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  submitOpt(
      {required String verificationId,
      required String smsCode,
      required BuildContext context}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    await auth.signInWithCredential(credential).whenComplete(() =>
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const Home()),
            (route) => false));
    // bool newUser = await checkLogin();
    // if (newUser) {
    //   Navigator.of(context).pushAndRemoveUntil(
    //       MaterialPageRoute(builder: (context) => const Navbar()),
    //       (route) => false);
    // } else {
    //   Navigator.of(context).pushAndRemoveUntil(
    //       MaterialPageRoute(builder: (context) => const RegisterScreen()),
    //       (route) => false);
    // }
  }

  logOut({required BuildContext context}) {
    auth.signOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const Login()),
        (route) => false);
  }
}
