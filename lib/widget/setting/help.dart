import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  sendquery({required String userquery}) {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Query")
        .doc()
        .set({
      "uid": FirebaseAuth.instance.currentUser!.uid,
      "Query": userquery
    });
  }

  Future sendEmail() async {
    String email = "shekharingale14@gmail.com";
    // final String url = 'mailto:$email?subject=${Uri.encodeFull(subject)}';

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    await launchUrl(emailLaunchUri);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController quey = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgcolor,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: black,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Help",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Zilla",
              fontSize: 24,
              fontWeight: FontWeight.w400,
            )),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: shadowdecoration,
              child: TextField(
                maxLines: 8,
                keyboardType: TextInputType.multiline,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    hintText: "write your query or feedback here..",
                    hintStyle: const TextStyle(
                      color: Color(
                        0xff9f9f9f,
                      ),
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    )),
                controller: quey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    fixedSize: const Size(350, 55)),
                onPressed: () {
                  if (quey.text.isNotEmpty) {
                    sendquery(userquery: quey.text);
                    quey.clear();
                    Fluttertoast.showToast(
                        msg: "Query send ",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: primary,
                        textColor: Colors.white,
                        fontSize: 20.0);
                  } else {
                    Fluttertoast.showToast(
                        msg: "Query Empty",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: primary,
                        textColor: Colors.white,
                        fontSize: 20.0);
                  }
                },
                child: const Text(
                  "Send Query",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                )),
            const SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    fixedSize: const Size(350, 55)),
                onPressed: () => sendEmail().whenComplete(() => {
                      quey.clear(),
                      Fluttertoast.showToast(
                          msg: "Query send ",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: primary,
                          textColor: Colors.white,
                          fontSize: 20.0)
                    }),
                child: const Text(
                  "Send Email",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
