import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scheme/Screen/Agent/applyuserscheme.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/api/checknewuser.dart';
import 'package:scheme/api/scanimage.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/provider/imagecopper.dart';
import 'package:scheme/provider/takeimage.dart';
import 'package:scheme/Screen/registrationscreens/aadharcardupload.dart';
import 'package:scheme/Screen/registrationscreens/donesplash.dart';
import 'package:scheme/widget/processingpopup.dart';
import 'package:scheme/widget/textfield.dart';
import 'package:scheme/Screen/registrationscreens/upload.dart';

String udidpic = "";

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
  bool pickedudid = false;

  Future<dynamic> picaadhar({required source, required String filename}) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source);
      String cropFile = await cropImage(pickedFile: image);
      // final File file = File(image!.path);
      setState(() {
        udidpic = cropFile;
        pickedudid = true;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Something went Wrong');
        print(e.toString());
      }
    }
  }

  Future uploadImgdata() async {
    var passportimage = await fireStoreFileUpload(
        "${FirebaseAuth.instance.currentUser!.uid}/userphoto.jpg", imagepic);

    var addharpiclink = await fireStoreFileUpload(
        "${FirebaseAuth.instance.currentUser!.uid}/aadharcard.jpg", aadharpic);

    var udidpiclink = await fireStoreFileUpload(
        "${FirebaseAuth.instance.currentUser!.uid}/udidcard.jpg", udidpic);

    await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .update({
      "image": passportimage,
      "udidimage": udidpiclink,
      "aadharimage": addharpiclink
    });
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
                    "Upload UDID card",
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
              Center(
                child: InkWell(
                  onTap: () =>
                      picaadhar(source: ImageSource.gallery, filename: "udid")
                          .whenComplete(() async {
                    if (udidpic == '') {
                      return;
                    }
                    showDialog(
                        context: context,
                        builder: (c) => processingPopup(
                            context: context, msg: "Scanning Image"));
                    await getUDIDDetails(path: udidpic).then((value) {
                      _disabilitypercentage.text = value["percent"].toString();
                      _disbilitytype.text = value["type"].toString();
                      _udidNo.text = value["udid"].toString();
                    }).whenComplete(() async => Navigator.pop(context));
                    isagent
                        ? setState(
                            () {
                              agentbyudidimage = udidpic;
                            },
                          )
                        : await imageupload(
                            filename: "udidimage", file: udidpic);
                  }),
                  child: pickedudid
                      ? Image.file(File(udidpic))
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
                "UDID Card Details",
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
                controller: _udidNo,
                title: "UDID Card No.",
                typeofKeyboard: TextInputType.text,
              ),
              const SizedBox(height: 18),
              TextFieldTake(
                controller: _udidname,
                title: "Name",
                typeofKeyboard: TextInputType.text,
              ),
              const SizedBox(height: 18),
              TextFieldTake(
                controller: _disbilitytype,
                title: "Disability Type",
                typeofKeyboard: TextInputType.text,
              ),
              const SizedBox(height: 18),
              TextFieldTake(
                controller: _disabilitypercentage,
                title: "Disability Percentage",
                typeofKeyboard: TextInputType.text,
              ),
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                  child: ElevatedButton(
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (c) => processingPopup(
                                context: context, msg: "Uploading data"));
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

                        !isagent
                            ? await uploadImgdata().whenComplete(
                                () => userdataupload().whenComplete(() => {
                                      registration = true,
                                      Navigator.pop(context),
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const DoneUpload()))
                                    }))
                            : Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ApplyUserScheme()),
                                (route) => false);
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
