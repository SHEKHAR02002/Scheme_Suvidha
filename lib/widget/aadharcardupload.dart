import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/api/scanimage.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/provider/imagecopper.dart';
import 'package:scheme/provider/takeimage.dart';
import 'package:scheme/widget/processingpopup.dart';
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
  String aadharpic = "";
  bool pickedaadhar = false;

  Future<dynamic> picaadhar({required source, required String filename}) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source);
      String cropFile = await cropImage(pickedFile: image);
      // final File file = File(image!.path);
      setState(() {
        if (filename == "aadhar") {
          aadharpic = cropFile;
          pickedaadhar = true;
        } else {
          if (kDebugMode) {
            print('Something went Wrong');
          }
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
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    "Upload Aadhar card",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () =>
                    picaadhar(source: ImageSource.gallery, filename: "aadhar")
                        .whenComplete(() async {
                  if (aadharpic == '') {
                    return;
                  }
                  showDialog(
                      context: context,
                      builder: (c) => processingPopup(
                          context: context, msg: "Scanning Image"));

                  await getAadharDetails(path: aadharpic).then((value) {
                    try {
                      _aadharNo.text = value["aadhar_number"].toString();
                      _dob.text = value["dob"].toString();
                      _gender.text = value["gender"].toString();
                      _name.text = value["name"].toString();
                    } catch (e) {
                      _aadharNo.text = "";
                      _dob.text = "";
                      _gender.text = "";
                      _name.text = "";
                      _phoneNo.text = "";
                    }
                  }).whenComplete(() => Navigator.pop(context));
                  await imageupload(filename: "aadharimage", file: aadharpic);
                }),
                child: Center(
                  child: pickedaadhar
                      ? Image.file(File(aadharpic))
                      : Container(
                          width: width,
                          decoration: shadowdecoration,
                          child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 65),
                              child: Icon(
                                Icons.add,
                                size: 50,
                              )),
                        ),
                ),
              ),
              const SizedBox(
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
              const SizedBox(
                height: 20,
              ),
              TextFieldTake(
                controller: _aadharNo,
                title: "Aadhar Card No",
                typeofKeyboard: TextInputType.number,
              ),
              const SizedBox(height: 18),
              TextFieldTake(
                  controller: _name,
                  title: "Name",
                  typeofKeyboard: TextInputType.text),
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
              TextFieldTake(
                  controller: _phoneNo,
                  title: "Phone No.",
                  typeofKeyboard: const TextInputType.numberWithOptions()),
              const SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_aadharNo.text != "" &&
                              _dob.text != "" &&
                              _gender.text != "" &&
                              _name.text != "" &&
                              _phoneNo.text != "") {
                            aadharNo = _aadharNo.text;
                            dob = _dob.text;
                            gender = _gender.text;
                            name = _name.text;
                            phoneNo = _phoneNo.text;
                          } else {
                            print("Field is empty");
                          }
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (contex) => const UdidCardUpload()));
                      },

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
