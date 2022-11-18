import 'package:flutter/material.dart';
import 'package:scheme/Screen/apply.dart';
import 'package:scheme/Theme/color.dart';

class UploadUdid extends StatefulWidget {
  const UploadUdid({super.key});

  @override
  State<UploadUdid> createState() => _UploadUdidState();
}

class _UploadUdidState extends State<UploadUdid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Upload Your UDID Card",
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
                  decoration: BoxDecoration(
                    color: textfiled,
                    border: Border.all(color: button),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  height: 200,
                  width: 340,
                  child: Padding(
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
                                            Column(
                                              children: [
                                                Icon(
                                                  Icons.add_a_photo_outlined,
                                                  size: 60,
                                                  color: text1,
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
                                                          FontWeight.w500),
                                                )
                                              ],
                                            ),
                                            const Spacer(),
                                            Column(
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
                                                          FontWeight.w500),
                                                )
                                              ],
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
                          "Upload Your UDID Card",
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
                      onPressed: () {},
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    " N.A.",
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
                    "UDID Card No.",
                    style: TextStyle(
                      color: text1,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Overpass",
                      letterSpacing: 0.48,
                    ),
                  ),
                  Text(
                    " N.A.",
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
                    "Disability Type",
                    style: TextStyle(
                      color: text1,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Overpass",
                      letterSpacing: 0.48,
                    ),
                  ),
                  Text(
                    " N.A.",
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
                    "% of Disability",
                    style: TextStyle(
                      color: text1,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Overpass",
                      letterSpacing: 0.48,
                    ),
                  ),
                  Text(
                    " N.A.",
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
                    "Date Of Issue",
                    style: TextStyle(
                      color: text1,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Overpass",
                      letterSpacing: 0.48,
                    ),
                  ),
                  Text(
                    " N.A.",
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
                    "Valid Upto",
                    style: TextStyle(
                      color: text1,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Overpass",
                      letterSpacing: 0.48,
                    ),
                  ),
                  Text(
                    " N.A.",
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
                                    builder: (context) => const ApplyScheme()));
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
            ],
          ),
        ),
      ),
    );
  }
}
