import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/provider/takeimage.dart';
import 'package:scheme/widget/textfield.dart';
import 'package:scheme/widget/udidcardupload.dart';

class AadharCard extends StatefulWidget {
  const AadharCard({super.key});

  @override
  State<AadharCard> createState() => _AadharCardState();
}

class _AadharCardState extends State<AadharCard> {
  final TextEditingController _aadharNo = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phoneNo = TextEditingController();
  String? aadharpic = "";
  bool pickedaadhar = false;

  Future<dynamic> picaadhar({required source, required String filename}) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source);

      final File file = File(image!.path);
      setState(() {
        if (filename == "aadhar") {
          aadharpic = file.path;
          pickedaadhar = true;
        } else {
          print('Something went Wrong');
        }
      });
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    "Upload Aadhar card",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: width,
                  decoration: shadowdecoration,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 65),
                      child: InkWell(
                          onTap: () => picaadhar(
                                      source: ImageSource.camera,
                                      filename: "aadhar")
                                  .whenComplete(() {
                                setState(() {
                                  pickedaadhar = true;
                                });
                                imageupload(
                                    filename: "aadharimage", file: aadharpic!);
                              }),
                          child: Icon(
                            Icons.add,
                            size: 50,
                          ))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Aadhar Card Details",
                style: TextStyle(
                    color: primary,
                    fontFamily: "Overpass",
                    fontSize: 26,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldTake(controller: _aadharNo, title: "Aadhar Card No"),
              const SizedBox(height: 18),
              TextFieldTake(controller: _name, title: "Name"),
              const SizedBox(height: 18),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "DOB",
                        style: TextStyle(
                            color: black,
                            fontFamily: "Overpass",
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: width / 2.4,
                        decoration: shadowdecoration,
                        child: TextField(
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          controller: _dob,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gender",
                        style: TextStyle(
                            color: black,
                            fontFamily: "Overpass",
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: width / 2.4,
                        decoration: shadowdecoration,
                        child: TextField(
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          controller: _gender,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 18),
              TextFieldTake(controller: _phoneNo, title: "Phone No."),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                  child: ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UdidCardUpload())),

                      // upload(),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
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
                      )))
            ],
          ),
        ),
      ),
    );
  }
}