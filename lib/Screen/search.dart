import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/api/getscheme.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

List filterscheme = [];
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

Future getFilter({
  required String filter,
}) async {
  filterscheme.addAll(await getSchemes(filter: filter));
  print(filterscheme);
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        title: const Text(
          "Search",
          style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w400,
              fontFamily: "Zilla"),
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Container(
            alignment: Alignment.center,
            height: height / 1.5,
            width: width,
            decoration: BoxDecoration(
                color: secondary3, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
                    "Category type",
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
                          setState(() {
                            categorytype = value as String;
                            getFilter(filter: categorytype.toString());
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Schemes",
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
                      onPressed: () {
                        setState(() {
                          categorytype = "Select Scheme";
                        });
                      },
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
          )),
    );
  }
}
