import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/provider/imagecopper.dart';
import 'package:scheme/widget/aadharcardupload.dart';
import 'dart:io';

import 'package:scheme/widget/registeration.dart';

class UploadDoument extends StatefulWidget {
  const UploadDoument({super.key});

  @override
  State<UploadDoument> createState() => _UploadDoumentState();
}

class _UploadDoumentState extends State<UploadDoument> {
  bool pickedaadhar = false;
  bool pickedudid = false;
  bool imagepick = false;

  String imagepic = "";

  upload() async {
    passportimage = await fireStoreFileUpload(
        "${FirebaseAuth.instance.currentUser!.uid}/userphoto.jpg", imagepic);

    await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .update({"image": passportimage}).whenComplete(() => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Register())));
  }

  Future fireStoreFileUpload(refStorageImage, refImage) async {
    String pathValue = '';
    final firebaseStorageRef =
        FirebaseStorage.instance.ref().child(refStorageImage);
    final uploadTask = firebaseStorageRef.putFile(File(refImage));
    final taskSnapshot = await uploadTask.whenComplete(() {});
    await taskSnapshot.ref.getDownloadURL().then((value) async {
      pathValue = value;
    });

    return pathValue;
  }

  Future<dynamic> picImage({
    required source,
  }) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source);
      String cropFile = await userImagecopper(pickedFile: image);
      // final File file = File(image!.path);
      setState(() {
        imagepic = cropFile;
        imagepick = true;
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
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Upload Passport Size photo",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "(use file format .png, .jpg, .jpeg)",
                    style: TextStyle(
                        color: text2,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  InkWell(
                    onTap: () =>
                        //   showDialog(
                        //       context: context,
                        //       builder: (context) => const ImageSourcePopup());
                        // },

                        picImage(
                      source: ImageSource.camera,
                    ),
                    child: Container(
                        width: width,
                        decoration: shadowdecoration,
                        margin: const EdgeInsets.symmetric(vertical: 30),
                        padding: const EdgeInsets.symmetric(vertical: 70),
                        child: Center(
                          child: Stack(children: [
                            imagepick
                                ? Image.file(File(imagepic))
                                : SvgPicture.asset(
                                    "assets/upload_profile.svg",
                                  ),
                            const Positioned.fill(
                              child: Icon(
                                Icons.add_circle_outline,
                                size: 50,
                              ),
                            )
                          ]),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),

        //     child: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        //   child: Column(
        //     children: [
        //       SvgPicture.asset(
        //         "assets/upload.svg",
        //         height: 275,
        //         width: width,
        //       ),
        //       Container(
        //         decoration: shadowdecoration,
        //         child: Padding(
        //            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        //           child: Row(
        //             children: [
        //               Text(
        //                 "Passport Size photo",
        //                 style: TextStyle(
        //                     fontSize: 20, fontWeight: FontWeight.w400),
        //               ),
        //               const Spacer(),
        //               InkWell(
        //                 onTap: () =>
        //                     picImage(source: ImageSource.camera, filename: "Image")
        //                         .whenComplete(() {
        //                   setState(() {
        //                     imagepick = true;
        //                   });
        //                 }),
        //                 child: imagepick == false
        //                     ? const Icon(
        //                         Icons.add,
        //                         size: 30,
        //                       )
        //                     : const Icon(
        //                         Icons.check,
        //                         color: Color.fromRGBO(20, 253, 15, 1),
        //                         size: 30,
        //                       ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //       SizedBox(height: 30,),
        //       Container(
        //         decoration: shadowdecoration,
        //         child: Row(
        //           children: [
        //             const Padding(
        //               padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        //               child: Text(
        //                 "Aadhar Card",
        //                 style: TextStyle(
        //                     fontSize: 20, fontWeight: FontWeight.w400),
        //               ),
        //             ),
        //             const Spacer(),
        //             InkWell(
        //               onTap: () => picImage(
        //                       source: ImageSource.camera, filename: "aadhar")
        //                   .whenComplete(() {
        //                 setState(() {
        //                   pickedaadhar = true;
        //                 });
        //               }),
        //               child: Padding(
        //                 padding: const EdgeInsets.only(right: 10),
        //                 child: pickedaadhar == false
        //                     ? const Icon(
        //                         Icons.add,
        //                         size: 30,
        //                       )
        //                     : const Icon(
        //                         Icons.check,
        //                         color: Color.fromRGBO(20, 253, 15, 1),
        //                         size: 30,
        //                       ),
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //       const SizedBox(
        //         height: 30,
        //       ),
        //       Container(
        //         decoration: shadowdecoration,
        //         child: Row(
        //           children: [
        //             const Padding(
        //               padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        //               child: Text(
        //                 "UDID Card",
        //                 style: TextStyle(
        //                     fontSize: 20, fontWeight: FontWeight.w400),
        //               ),
        //             ),
        //             const Spacer(),
        //             InkWell(
        //               onTap: () =>
        //                   picImage(source: ImageSource.camera, filename: "udid")
        //                       .whenComplete(() {
        //                 setState(() {
        //                   pickedudid = true;
        //                 });
        //               }),
        //               child: Padding(
        //                 padding: const EdgeInsets.only(right: 10),
        //                 child: pickedudid == false
        //                     ? const Icon(
        //                         Icons.add,
        //                         size: 30,
        //                       )
        //                     : const Icon(
        //                         Icons.check,
        //                         color: Color.fromRGBO(20, 253, 15, 1),
        //                         size: 30,
        //                       ),
        //               ),
        //             )
        //           ],
        //         ),
        //       ),

        //     ],
        //   ),
        // )

        bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
            child: ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AadharCard())),

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
                ))));
  }
}
