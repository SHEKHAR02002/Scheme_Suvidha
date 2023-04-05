import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';

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
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                child: Row(children: const [
                  Text(
                    "upload here",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(
                        0xffd9d9d9,
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.add,
                    size: 26,
                  )
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
                child: Row(children: const [
                  Text(
                    "upload here",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(
                        0xffd9d9d9,
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.add,
                    size: 26,
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
                child: Row(children: const [
                  Text(
                    "upload here",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(
                        0xffd9d9d9,
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.add,
                    size: 26,
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
                child: Row(children: const [
                  Text(
                    "upload here",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(
                        0xffd9d9d9,
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.add,
                    size: 26,
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
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            _character == SingingCharacter.yes
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width,
                        decoration: shadowdecoration,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 7),
                          child: Row(children: const [
                            Text(
                              "upload here",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(
                                  0xffd9d9d9,
                                ),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.add,
                              size: 26,
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
                      _age == SingingCharacterage.ageyes
                          ? Container(
                              width: width,
                              decoration: shadowdecoration,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 7),
                                child: Row(children: const [
                                  Text(
                                    "upload here",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(
                                        0xffd9d9d9,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.add,
                                    size: 26,
                                  )
                                ]),
                              ),
                            )
                          : const SizedBox.shrink()
                    ],
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
            onPressed: () {},
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
            )),
      ),
    );
  }
}
