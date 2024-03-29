import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scheme/Screen/registrationscreens/uploaddocument.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/api/scanimage.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/provider/datepicker.dart';
import 'package:scheme/provider/imagecopper.dart';
import 'package:scheme/widget/processingpopup.dart';
import 'package:scheme/widget/textfield.dart';

String udidpic = "";

class UdidCardUpload extends StatefulWidget {
  const UdidCardUpload({super.key});

  @override
  State<UdidCardUpload> createState() => _UdidCardUploadState();
}

class _UdidCardUploadState extends State<UdidCardUpload> {
  final TextEditingController _udidNo = TextEditingController();
  // final TextEditingController _udidname = TextEditingController();
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

  // Future uploadImgdata() async {
  //   var passportimage = await fireStoreFileUpload(
  //       !isagent
  //           ? "${FirebaseAuth.instance.currentUser!.uid}/userphoto.jpg"
  //           : "${FirebaseAuth.instance.currentUser!.uid}/Users/$agentbyphoneNo/userphotot.jpg",
  //       imagepic);

  //   var addharpiclink = await fireStoreFileUpload(
  //       !isagent
  //           ? "${FirebaseAuth.instance.currentUser!.uid}/aadharcard.jpg"
  //           : "${FirebaseAuth.instance.currentUser!.uid}/Users/$agentbyphoneNo/aadharcard.jpg",
  //       aadharpic);

  //   var udidpiclink = await fireStoreFileUpload(
  //       !isagent
  //           ? "${FirebaseAuth.instance.currentUser!.uid}/udidcard.jpg"
  //           : "${FirebaseAuth.instance.currentUser!.uid}/Users/$agentbyphoneNo/udidcard.jpg",
  //       udidpic);

  //   isagent
  //       ? setState(() {
  //           agentbyimage = passportimage;
  //           agentbyaadharimage = addharpiclink;
  //           agentbyudidimage = udidpiclink;
  //         })
  //       : setState(() {
  //           image = passportimage;
  //           aadharimage = addharpiclink;
  //           udidimage = udidpiclink;
  //         });
  // }

  Widget setValidUpto() => Dialog(
        // insetPadding: const EdgeInsets.all(20),

        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            TextButton(
                onPressed: () {
                  _validupto.text = "Permanent";
                  Navigator.pop(context);
                },
                child: const Text("Set Permanent")),
            TextButton(
                onPressed: () {
                  DatePicker().getDate(
                      context: context,
                      setDate: (date) {
                        date == null
                            ? _validupto.text = _validupto.text
                            : _validupto.text = date;
                        Navigator.pop(context);
                      },
                      before: false);
                },
                child: const Text("Set The Date"))
          ]),
        ),
      );
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
                      _dataissue.text = value["doi"].toString();
                    }).whenComplete(() async => Navigator.pop(context));
                  }),
                  child: pickedudid
                      ? Image.file(
                          File(udidpic),
                          fit: BoxFit.contain,
                        )
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
                          onTap: () => DatePicker().getDate(
                              context: context,
                              setDate: (date) => date == null
                                  ? _dataissue.text = _dataissue.text
                                  : _dataissue.text = date,
                              before: true),
                          readOnly: true,
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
                          onTap: () => showDialog(
                              context: context, builder: (_) => setValidUpto()),
                          readOnly: true,
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
                        if (_udidNo.text != "" &&
                            _disabilitypercentage.text != "" &&
                            _disbilitytype.text != '' &&
                            _dataissue.text != "" &&
                            _validupto.text != "") {
                          setState(() {
                            udidNo = _udidNo.text;
                            disabilitypercentage = _disabilitypercentage.text;
                            disbilitytype = _disbilitytype.text;
                            dataissue = _dataissue.text;
                            validupto = _validupto.text;
                          });

                          // await uploadImgdata().whenComplete(() =>
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const UploadDocument()));
                        } else {
                          Fluttertoast.showToast(
                              msg: "Fill the details properly",
                              toastLength: Toast.LENGTH_LONG,
                              fontSize: 20,
                              backgroundColor: secondary,
                              textColor: Colors.black);
                          return;
                        }
                      },
                      // upload(),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          backgroundColor: primary,
                          minimumSize: Size(width, 50)),
                      child: const Text(
                        "Next",
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
