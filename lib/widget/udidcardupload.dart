import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/api/checknewuser.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/provider/takeimage.dart';
import 'package:scheme/widget/donesplash.dart';
import 'package:scheme/widget/textfield.dart';

class UdidCardUpload extends StatefulWidget {
  const UdidCardUpload({super.key});

  @override
  State<UdidCardUpload> createState() => _UdidCardUploadState();
}

class _UdidCardUploadState extends State<UdidCardUpload> {
  final TextEditingController _udidNo = TextEditingController();
  final TextEditingController _udidname = TextEditingController();
  final TextEditingController _disbilitytype = TextEditingController();
  final TextEditingController _disabilitypercentage = TextEditingController();
  final TextEditingController _dataissue = TextEditingController();
  final TextEditingController _validupto = TextEditingController();
  String? udidpic = "";
  bool pickedudid = false;

  Future<dynamic> picaadhar({required source, required String filename}) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source);

      final File file = File(image!.path);
      setState(() {
        if (filename == "udid") {
          udidpic = file.path;
          pickedudid = true;
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
                    "Upload UDID card",
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
                                      filename: "udid")
                                  .whenComplete(() {
                                setState(() {
                                  pickedudid = true;
                                });
                                imageupload(
                                    filename: "udidimage", file: udidpic!);
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
                "UDID Card Details",
                style: TextStyle(
                    color: primary,
                    fontFamily: "Overpass",
                    fontSize: 26,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldTake(controller: _udidNo, title: "UDID Card No."),
              const SizedBox(height: 18),
              TextFieldTake(controller: _udidname, title: "Name"),
              const SizedBox(height: 18),
              TextFieldTake(
                  controller: _disbilitytype, title: "Disability Type"),
              const SizedBox(height: 18),
              TextFieldTake(
                  controller: _disabilitypercentage,
                  title: "Disability Percentage"),
              const SizedBox(height: 18),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date Of Issue",
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
                          controller: _dataissue,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Valid Upto",
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
                          controller: _validupto,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_udidNo.text != "" &&
                              _udidname.text != "" &&
                              _disabilitypercentage.text != "" &&
                              _disbilitytype.text != '' &&
                              _dataissue.text != "" &&
                              _validupto.text != "") {
                            udidNo = _udidNo.text;
                            udidname = _udidname.text;
                            disabilitypercentage = _disabilitypercentage.text;
                            disbilitytype = _disbilitytype.text;
                            dataissue = _dataissue.text;
                            validupto = _validupto.text;
                          }
                        });
                        userdataupload().whenComplete(() => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoneUpload())));
                      },
                      // upload(),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          backgroundColor: primary,
                          minimumSize: Size(width, 50)),
                      child: const Text(
                        "Register",
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
