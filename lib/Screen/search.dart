
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Screen/home.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final List category = [
    "Select Scheme",
    "Health",
    "Pension",
    "Business",
    "Education",
    "Transport",
    "Marriage"
  ];
  String? categorytype = "Select Scheme";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: width / 1.3,
                  decoration: shadowdecoration,
                  child: TextField(
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          "assets/search.svg",
                          color: primary,
                          height: 10,
                          width: 10,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  "assets/filter.svg",
                  color: black,
                  height: 30,
                  width: 30,
                ),
              ],
            ),
            SizedBox(
              height: height / 10,
            ),
            Container(
              alignment: Alignment.center,
              height: height / 1.5,
              width: width,
              decoration: BoxDecoration(
                  color: secondary3, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Search Filter",
                        style: TextStyle(
                            color: primary,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: width / 7,
                    ),
                    Text(
                      "Disability type",
                      style: TextStyle(
                          color: black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
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
                          items: category
                              .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Overpass'),
                                    ),
                                  ))
                              .toList(),
                          value: categorytype,
                          onChanged: (value) {
                            categorytype = value as String;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Scheme type",
                      style: TextStyle(
                          color: black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
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
                          items: category
                              .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Overpass'),
                                    ),
                                  ))
                              .toList(),
                          value: categorytype,
                          onChanged: (value) {
                            categorytype = value as String;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: width / 8,
                    ),
                    ElevatedButton(
                        onPressed: () async {},
                        // =>Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpBottomSheet())),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: primary,
                            minimumSize: Size(width, 50)),
                        child: const Text(
                          "Apply",
                          style: TextStyle(
                              fontFamily: "Overpass",
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        )),
                    const SizedBox(
                      height: 14,
                    ),
                    ElevatedButton(
                        onPressed: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                            (route) => false),
                        // =>Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpBottomSheet())),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: primary,
                            minimumSize: Size(width, 50)),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                              fontFamily: "Overpass",
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
