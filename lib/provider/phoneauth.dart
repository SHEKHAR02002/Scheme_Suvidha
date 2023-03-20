import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scheme/Screen/home.dart';
import 'package:scheme/Screen/login.dart';
import 'package:scheme/Screen/otpbottom.dart';
import 'package:scheme/api/checknewuser.dart';
import 'package:scheme/api/getuserdetail.dart';

class PhoneAuth {
  FirebaseAuth auth = FirebaseAuth.instance;
  sendOtp({required String phoneNo, required BuildContext context}) async {
    bool loader = false;
    await auth.verifyPhoneNumber(
      phoneNumber: "+91$phoneNo",
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
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
                ));
        loader = true;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    return loader;
  }

  submitOpt(
      {required String verificationId,
      required String phoneNo,
      required String smsCode,
      required BuildContext context}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      await auth.signInWithCredential(credential).whenComplete(
          () => userCredentialAuth(context: context, phoneNo: phoneNo));
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
  }

  Future userCredentialAuth(
      {required BuildContext context, required String phoneNo}) async {
    try {
      await checkuser().then((value) async {
        if (value) {
          await newuser(phoneno: phoneNo).whenComplete(() async =>
              await UserDetails().getUserDetails(context: context).whenComplete(
                  () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const Home()),
                      (route) => false)));
        } else {
          await getUserDeatilsApi(context: context).whenComplete(() {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const Home()),
                (route) => false);
          });
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  logOut({required BuildContext context}) {
    auth.signOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const Login()),
        (route) => false);
  }
}
