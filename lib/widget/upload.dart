import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/widget/registeration.dart';
import 'dart:io';

class UploadDoument extends StatefulWidget {
  const UploadDoument({super.key});

  @override
  State<UploadDoument> createState() => _UploadDoumentState();
}

class _UploadDoumentState extends State<UploadDoument> {
  bool pickedaadhar = false;
  bool pickedudid = false;
  String aadharcard = "";
  String udidcard = "";
  Future<dynamic> picImage({required source, required String filename}) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source);

      final File file = File(image!.path);
      setState(() {
        if (filename == "aadhar") {
          aadharcard = file.path;
          pickedaadhar = true;
        } else if (filename == "udid") {
          udidcard = file.path;
          pickedudid = true;
        }
      });
      log(aadharcard);
      // String cropFile = await userImage(pickedFile: XFile(file.path));
      // setState(() {
      //   customProfileImage = cropFile;
      // });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: bgcolor,
            elevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text(
              "Upload documents",
              style: TextStyle(
                  color: black, fontSize: 34, fontWeight: FontWeight.w700),
            )),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/upload.svg",
                height: 275,
                width: width,
              ),
              Container(
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
                        blurRadius: 2.0,
                        offset: Offset(0, 0))
                  ],
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Aadhar Card",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => picImage(
                              source: ImageSource.gallery, filename: "aadhar")
                          .whenComplete(() {
                        setState(() {
                          pickedaadhar = true;
                        });
                      }),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          pickedaadhar ? Icons.check : Icons.add,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              Container(
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
                        blurRadius: 2.0,
                        offset: Offset(0, 0))
                  ],
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "UDID Card",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => picImage(
                              source: ImageSource.gallery, filename: "udid")
                          .whenComplete(() {
                        setState(() {
                          pickedaadhar = true;
                        });
                      }),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          pickedudid ? Icons.check : Icons.add,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
            child: ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Register())),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: primary,
                    minimumSize: Size(width, 50)),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                      fontFamily: "Overpass",
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ))));
  }
}
