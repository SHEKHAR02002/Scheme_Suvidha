import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scheme/provider/takeimage.dart';
import 'package:scheme/Screen/upload_udid.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/widget/aadhardata.dart';
import 'package:flutter/services.dart' as rootBundle;

bool checkUserProfileImagePath = false;

class AadharUpload extends StatefulWidget {
  const AadharUpload({super.key});
  @override
  State<AadharUpload> createState() => _AadharUploadState();
}

String check = "no";

class _AadharUploadState extends State<AadharUpload> {
  scanImage({required bool check}) {
    if (check) {
      setState(() {
        aadharNo = "12414248989";
        phoneNo = "1231432457";
        dob = "08/01/2022";
        name = "Raj Patil";
        gender = "Male";
      });
    } else {
      setState(() {
        aadharNo = "N.A";
        phoneNo = "N.A";
        dob = "N.A";
        name = "N.A";
        gender = "N.A";
      });
    }
  }

  @override
  void initState() {
    scanImage(check: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Upload Your Aadhar Card",
          style: TextStyle(
              color: text1,
              fontFamily: 'Overpass',
              fontSize: 25,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: 340,
                  decoration: BoxDecoration(
                    color: textfiled,
                    border: Border.all(color: button),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: aadharImage != ""
                      ? Image.file(File(aadharImage))
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20))),
                                      context: context,
                                      builder: (context) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 80),
                                            child: SizedBox(
                                              height: 150,
                                              width: 20,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            // final image = ImagePicker()
                                                            //     .pickImage(
                                                            //         source:
                                                            //             ImageSource
                                                            //                 .camera);

                                                            takeUserProfileImage(
                                                                state:
                                                                    (image) =>
                                                                        setState(
                                                                            () {
                                                                          aadharImage =
                                                                              image!.path;
                                                                          checkUserProfileImagePath =
                                                                              true;
                                                                        }),
                                                                source:
                                                                    ImageSource
                                                                        .camera);
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .add_a_photo_outlined,
                                                            size: 60,
                                                            color: text1,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(
                                                          "Camera",
                                                          style: TextStyle(
                                                              color: text1,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Icon(
                                                          Icons.camera,
                                                          size: 60,
                                                          color: text1,
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(
                                                          "Gallery",
                                                          style: TextStyle(
                                                              color: text1,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ));
                                },
                                child: Icon(
                                  Icons.file_upload_outlined,
                                  size: 100,
                                  color: text1,
                                ),
                              ),
                              Text(
                                "Upload Your Aadhar Card",
                                style: TextStyle(
                                    color: text1,
                                    fontFamily: 'Overpass',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1),
                              )
                            ],
                          ),
                        ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: button),
                      onPressed: () {
                        scanImage(check: true);
                      },
                      child: const Text(
                        "Scan",
                        style: TextStyle(
                            fontFamily: 'Overpass',
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Aadhar Card No.",
                      style: TextStyle(
                        color: text1,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Overpass",
                        letterSpacing: 0.48,
                      ),
                    ),
                    Text(
                      aadharNo,
                      style: TextStyle(
                        color: text2,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Overpass",
                        letterSpacing: 0.36,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Name",
                      style: TextStyle(
                        color: text1,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Overpass",
                        letterSpacing: 0.48,
                      ),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        color: text2,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Overpass",
                        letterSpacing: 0.36,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "DOB",
                      style: TextStyle(
                        color: text1,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Overpass",
                        letterSpacing: 0.48,
                      ),
                    ),
                    Text(
                      dob,
                      style: TextStyle(
                        color: text2,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Overpass",
                        letterSpacing: 0.36,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Gender",
                      style: TextStyle(
                        color: text1,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Overpass",
                        letterSpacing: 0.48,
                      ),
                    ),
                    Text(
                      gender,
                      style: TextStyle(
                        color: text2,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Overpass",
                        letterSpacing: 0.36,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Phone No.",
                      style: TextStyle(
                        color: text1,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Overpass",
                        letterSpacing: 0.48,
                      ),
                    ),
                    Text(
                      phoneNo,
                      style: TextStyle(
                        color: text2,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Overpass",
                        letterSpacing: 0.36,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                backgroundColor: button),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Upload_Udid()));
                            },
                            child: const Text(
                              "Next",
                              style: TextStyle(
                                  fontFamily: 'Overpass',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<List<AadharDataModel>> ReadJsonData() async {
  //   final jsondata =
  //       await rootBundle.rootBundle.loadString("jsonfile/aadhar.json");
  //   final list = json.decode(jsondata) as List<dynamic>;

  //   return list.map((e) => AadharDataModel.fromJson(e)).toList();
  // }
}
