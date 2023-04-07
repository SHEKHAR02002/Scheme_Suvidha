import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scheme/Screen/registrationscreens/aadharcardupload.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/command/screenstate.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/provider/imagecopper.dart';
import 'dart:io';

String imagepic = "";

Future<dynamic> takepicImage() async {
  try {
    final XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 40);
    String cropFile = await userImagecopper(pickedFile: image);
    // final File file = File(image!.path);

    !isagent ? imagepic = cropFile : agentbyimage = cropFile;
    imagepick = true;
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
  }
}

class UploadDoument extends StatefulWidget {
  const UploadDoument({super.key});

  @override
  State<UploadDoument> createState() => _UploadDoumentState();
}

bool imagepick = false;

class _UploadDoumentState extends State<UploadDoument> with RouteAware {
  @override
  void initState() {
    screenSate = "userphoto";
    setVisuals("userphoto");
    super.initState();
  }

  @override
  void didPush() {
    setVisuals("addharcardpage");
    super.didPush();
  }

  @override
  void didPop() {
    setVisuals("Home");
    super.didPop();
  }

  // upload() async {
  //   showDialog(
  //       context: context,
  //       builder: (c) =>
  //           processingPopup(context: context, msg: "Uploading Image"));
  //   passportimage = await fireStoreFileUpload(
  //       "${FirebaseAuth.instance.currentUser!.uid}/userphoto.jpg", imagepic);

  //   await FirebaseFirestore.instance
  //       .collection("Users")
  //       .doc(FirebaseAuth.instance.currentUser!.uid.toString())
  //       .update({"image": passportimage}).whenComplete(
  //     () => Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => const AadharCard())),
  //   );
  // }

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
      final XFile? image =
          await ImagePicker().pickImage(source: source, imageQuality: 40);
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
    double? fontsize14 =
        ResponsiveValue(context, defaultValue: 14.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 10.0),
      Condition.largerThan(name: TABLET, value: 26.0)
    ]).value as double;
    double? fontsize20 =
        ResponsiveValue(context, defaultValue: 20.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 16.0),
      Condition.largerThan(name: TABLET, value: 34.0)
    ]).value as double;
    double? iconsize =
        ResponsiveValue(context, defaultValue: 50.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 40.0),
      Condition.largerThan(name: TABLET, value: 70.0)
    ]).value as double;
    double? imgsize =
        ResponsiveValue(context, defaultValue: 240.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 200.0),
      Condition.largerThan(name: TABLET, value: 350.0)
    ]).value as double;
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Upload Passport Size photo",
                      style: TextStyle(
                          fontSize: fontsize20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "(use file format .png, .jpg, .jpeg)",
                      style: TextStyle(
                          color: text2,
                          fontSize: fontsize14,
                          fontWeight: FontWeight.w400),
                    ),
                    InkWell(
                      onTap: () => picImage(
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
                                      height: imgsize,
                                      width: imgsize,
                                    ),
                              Positioned.fill(
                                child: Icon(
                                  Icons.add_circle_outline,
                                  size: iconsize,
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
          bottomNavigationBar: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AadharCard()));
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
                  )))),
    );
  }
}
