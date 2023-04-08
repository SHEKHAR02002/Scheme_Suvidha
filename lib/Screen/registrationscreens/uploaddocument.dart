import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scheme/Screen/Agent/applyuserscheme.dart';
import 'package:scheme/Screen/registrationscreens/aadharcardupload.dart';
import 'package:scheme/Screen/registrationscreens/donesplash.dart';
import 'package:scheme/Screen/registrationscreens/udidcardupload.dart';
import 'package:scheme/Screen/registrationscreens/upload.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/api/agentfuncation.dart';
import 'package:scheme/api/checknewuser.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/provider/takeimage.dart';
import 'package:scheme/widget/processingpopup.dart';

enum SingingCharacter { yes, no }

enum SingingCharacterage { ageyes, ageno }

class UploadDocument extends StatefulWidget {
  const UploadDocument({super.key});

  @override
  State<UploadDocument> createState() => _UploadDocumentState();
}

final List addressprooflist = ["Light Bill", "Ration Card"];
final List ageprooflist = ["Brith Date", "Leaving Certificate"];
String? addressproof = "Light Bill";
String? ageproof = "Brith Date";

class _UploadDocumentState extends State<UploadDocument> {
  SingingCharacter? _character = SingingCharacter.no;
  SingingCharacterage? _age = SingingCharacterage.ageno;
  String? address = "",
      age = "",
      domacile = "",
      income = "",
      last = "",
      parent = "";
  bool isstudent = false;
  bool isbelow18 = false;
  PlatformFile? addressproofpicked;
  PlatformFile? ageproofpicked;
  PlatformFile? domacilepicked;
  PlatformFile? incomepicked;
  PlatformFile? marksheet;
  PlatformFile? parentid;
  UploadTask? uploadTask;
  bool? pickaddress = false;
  bool? pickdoma = false;
  bool? pickage = false;
  bool? pickincome = false;
  bool? picklast = false;
  bool? pickparent = false;
  String? firebasepath = "";

  Future uploadImgdata() async {
    var passportimage = await fireStoreFileUpload(
        !isagent
            ? "${FirebaseAuth.instance.currentUser!.uid}/userphoto.jpg"
            : "${FirebaseAuth.instance.currentUser!.uid}/Users/$phoneNo/userphotot.jpg",
        imagepic);

    var addharpiclink = await fireStoreFileUpload(
        !isagent
            ? "${FirebaseAuth.instance.currentUser!.uid}/aadharcard.jpg"
            : "${FirebaseAuth.instance.currentUser!.uid}/Users/$phoneNo/aadharcard.jpg",
        aadharpic);

    var udidpiclink = await fireStoreFileUpload(
        !isagent
            ? "${FirebaseAuth.instance.currentUser!.uid}/udidcard.jpg"
            : "${FirebaseAuth.instance.currentUser!.uid}/Users/$phoneNo/udidcard.jpg",
        udidpic);

    if (mounted) {
      isagent
          ? setState(() {
              agentbyimage = passportimage;
              agentbyaadharimage = addharpiclink;
              agentbyudidimage = udidpiclink;
            })
          : setState(() {
              image = passportimage;
              aadharimage = addharpiclink;
              udidimage = udidpiclink;
            });
    }
  }

  Future selectFile({required String filename}) async {
    showDialog(
        context: context,
        builder: ((context) =>
            processingPopup(context: context, msg: "Uploading....")));
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowCompression: true,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      setState(() {
        if (filename == "address") {
          addressproofpicked = result.files.first;
          uploadFile(filename: "Aadress Proof", pickedfile: addressproofpicked)
              .whenComplete(() => Navigator.pop(context));
        } else if (filename == "age") {
          ageproofpicked = result.files.first;
          uploadFile(filename: "Age Proof", pickedfile: ageproofpicked)
              .whenComplete(() => Navigator.pop(context));
        } else if (filename == "domacile") {
          domacilepicked = result.files.first;
          uploadFile(filename: "Domacile Proof", pickedfile: domacilepicked)
              .whenComplete(() => Navigator.pop(context));
        } else if (filename == "income") {
          incomepicked = result.files.first;
          uploadFile(filename: "Income Proof", pickedfile: incomepicked)
              .whenComplete(() => Navigator.pop(context));
        } else if (filename == "marksheet") {
          marksheet = result.files.first;
          uploadFile(filename: "Last Year Passing", pickedfile: marksheet)
              .whenComplete(() => Navigator.pop(context));
        } else if (filename == "parentid") {
          parentid = result.files.first;
          uploadFile(filename: "Parent ID Proof", pickedfile: parentid)
              .whenComplete(() => Navigator.pop(context));
        } else {
          print("wrong name");
        }
      });
    }
  }

  Future uploadFile(
      {required String filename, required PlatformFile? pickedfile}) async {
    //creat path
    final path = !isagent
        ? "${FirebaseAuth.instance.currentUser!.uid.toString()}/$filename"
        : "${FirebaseAuth.instance.currentUser!.uid}/Users/$phoneNo/$filename";
    final file = File(pickedfile!.path!);

    //upload firestorage
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() async {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      if (filename == "Aadress Proof") {
        !isagent
            ? addressprooflink = urlDownload
            : agentbyaddressprooflink = urlDownload;
        setState(() {
          address = "Address proof Uploaded";
          pickaddress = true;
        });
      } else if (filename == "Age Proof") {
        !isagent
            ? ageprooflink = urlDownload
            : agentbyageprooflink = urlDownload;
        setState(() {
          age = "Age proof Uploaded";
          pickage = true;
        });
      } else if (filename == "Domacile Proof") {
        !isagent
            ? domacilelink = urlDownload
            : agentbydomacilelink = urlDownload;
        setState(() {
          domacile = "Domacile proof Uploaded";
          pickdoma = true;
        });
      } else if (filename == "Income Proof") {
        !isagent
            ? incomecertilink = urlDownload
            : agentbyincomecertilink = urlDownload;
        setState(() {
          income = "Income proof Uploaded";
          pickincome = true;
        });
      } else if (filename == "Last Year Passing") {
        !isagent
            ? lastyearlink = urlDownload
            : agentbylastyearlink = urlDownload;

        setState(() {
          last = "Last Year Passing Uploaded";
          picklast = true;
        });
      } else if (filename == "Parent ID Proof") {
        !isagent
            ? parentidlink = urlDownload
            : agentbyparentidlink = urlDownload;
        setState(() {
          parent = "Parent ID Uploaded";
          pickparent = true;
        });
      } else {
        print("something Wrong");
      }
    });
    // return urlDownload;
  }

  checkfunction({required SingingCharacter? check}) {
    if (check == SingingCharacter.yes) {
      setState(() {
        isstudent = true;
      });
    } else {
      setState(() {
        isstudent = false;
      });
    }
  }

  agecheck({required SingingCharacterage? check}) {
    if (check == SingingCharacterage.ageyes) {
      setState(() {
        isbelow18 = true;
      });
    } else {
      setState(() {
        isbelow18 = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    "Upload Document",
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
              Text(
                "Address Proof",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w400, color: primary),
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonHideUnderline(
                child: Container(
                  width: width,
                  decoration: shadowdecoration,
                  child: DropdownButton2(
                    dropdownDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    // buttonDecoration: shadowdecoration,
                    items: addressprooflist
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Row(
                                children: [
                                  const Icon(
                                    CupertinoIcons.doc,
                                    size: 22,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    item,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Overpass'),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                    value: addressproof,
                    onChanged: (value) {
                      setState(() {
                        addressproof = value as String;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: width,
                decoration: shadowdecoration,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  child: Row(children: [
                    address == ""
                        ? const Text(
                            "upload here",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(
                                0xffd9d9d9,
                              ),
                            ),
                          )
                        : Text(
                            address.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(
                                0xffd9d9d9,
                              ),
                            ),
                          ),
                    const Spacer(),
                    InkWell(
                        onTap: () => selectFile(filename: "address"),
                        child: pickaddress == true
                            ? const Icon(
                                CupertinoIcons.checkmark_alt,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.add,
                                size: 26,
                              ))
                  ]),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Age Proof",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w400, color: primary),
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonHideUnderline(
                child: Container(
                  width: width,
                  decoration: shadowdecoration,
                  child: DropdownButton2(
                    dropdownDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    // buttonDecoration: shadowdecoration,
                    items: ageprooflist
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Row(
                                children: [
                                  const Icon(
                                    CupertinoIcons.doc,
                                    size: 22,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    item,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Overpass'),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                    value: ageproof,
                    onChanged: (value) {
                      setState(() {
                        ageproof = value as String;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: width,
                decoration: shadowdecoration,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  child: Row(children: [
                    age == ""
                        ? const Text(
                            "upload here",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(
                                0xffd9d9d9,
                              ),
                            ),
                          )
                        : Text(
                            age.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(
                                0xffd9d9d9,
                              ),
                            ),
                          ),
                    const Spacer(),
                    InkWell(
                      onTap: () => selectFile(filename: "age"),
                      child: pickage == true
                          ? const Icon(
                              CupertinoIcons.checkmark_alt,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.add,
                              size: 26,
                            ),
                    )
                  ]),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Domicile Certificate",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w400, color: primary),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: width,
                decoration: shadowdecoration,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  child: Row(children: [
                    domacile == ""
                        ? const Text(
                            "upload here",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(
                                0xffd9d9d9,
                              ),
                            ),
                          )
                        : Text(
                            domacile.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(
                                0xffd9d9d9,
                              ),
                            ),
                          ),
                    const Spacer(),
                    InkWell(
                      onTap: () => selectFile(filename: "domacile"),
                      child: pickdoma == true
                          ? const Icon(
                              CupertinoIcons.checkmark_alt,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.add,
                              size: 26,
                            ),
                    )
                  ]),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Income Certificate",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w400, color: primary),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: width,
                decoration: shadowdecoration,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  child: Row(children: [
                    income == ""
                        ? const Text(
                            "upload here",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(
                                0xffd9d9d9,
                              ),
                            ),
                          )
                        : Text(
                            income.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(
                                0xffd9d9d9,
                              ),
                            ),
                          ),
                    const Spacer(),
                    InkWell(
                      onTap: () => selectFile(filename: "income"),
                      child: pickincome == true
                          ? const Icon(
                              CupertinoIcons.checkmark_alt,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.add,
                              size: 26,
                            ),
                    )
                  ]),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Are you a Student ?",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w400, color: primary),
              ),
              Row(
                children: [
                  SizedBox(
                    width: width / 3,
                    child: ListTile(
                      title: const Text('Yes'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.yes,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            checkfunction(check: _character);
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 3,
                    child: ListTile(
                      title: const Text('No'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.no,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                            checkfunction(check: _character);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              isstudent
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Last Year Passing Certificate",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          decoration: shadowdecoration,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 7),
                            child: Row(children: [
                              last == ""
                                  ? const Text(
                                      "upload here",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color(
                                          0xffd9d9d9,
                                        ),
                                      ),
                                    )
                                  : Text(
                                      last.toString(),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Color(
                                          0xffd9d9d9,
                                        ),
                                      ),
                                    ),
                              const Spacer(),
                              InkWell(
                                onTap: () => selectFile(filename: "marksheet"),
                                child: picklast == true
                                    ? const Icon(
                                        CupertinoIcons.checkmark_alt,
                                        color: Colors.green,
                                      )
                                    : const Icon(
                                        Icons.add,
                                        size: 26,
                                      ),
                              )
                            ]),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Is your age below 18 ?",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: primary),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: width / 3,
                              child: ListTile(
                                title: const Text('Yes'),
                                leading: Radio<SingingCharacterage>(
                                  value: SingingCharacterage.ageyes,
                                  groupValue: _age,
                                  onChanged: (SingingCharacterage? value) {
                                    setState(() {
                                      _age = value;
                                      agecheck(check: _age);
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width / 3,
                              child: ListTile(
                                title: const Text('No'),
                                leading: Radio<SingingCharacterage>(
                                  value: SingingCharacterage.ageno,
                                  groupValue: _age,
                                  onChanged: (SingingCharacterage? value) {
                                    setState(() {
                                      _age = value;
                                      agecheck(check: _age);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        isbelow18
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Parent/Guardian ID",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: width,
                                    decoration: shadowdecoration,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 7),
                                      child: Row(children: [
                                        parent == ""
                                            ? const Text(
                                                "upload here",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(
                                                    0xffd9d9d9,
                                                  ),
                                                ),
                                              )
                                            : Text(
                                                parent.toString(),
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Color(
                                                    0xffd9d9d9,
                                                  ),
                                                ),
                                              ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () =>
                                              selectFile(filename: "parentid"),
                                          child: pickparent == true
                                              ? const Icon(
                                                  CupertinoIcons.checkmark_alt,
                                                  color: Colors.green,
                                                )
                                              : const Icon(
                                                  Icons.add,
                                                  size: 26,
                                                ),
                                        )
                                      ]),
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox.shrink()
                      ],
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: ((context) =>
                      processingPopup(context: context, msg: "Uploading....")));
              uploadImgdata().whenComplete(() => {
                    !isagent
                        ? userdataupload().whenComplete(() async =>
                            await checkuser(context: context).whenComplete(() {
                              registration = true;
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DoneUpload()));
                            }))
                        : agentbyregistration().whenComplete(() {
                            Fluttertoast.showToast(
                                msg: "Registration Done",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: primary,
                                textColor: Colors.white,
                                fontSize: 20.0);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ApplyUserScheme()),
                                (route) => false);
                          })
                  });
            },
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
            )),
      ),
    );
  }
}
