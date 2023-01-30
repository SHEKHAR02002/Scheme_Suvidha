import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Theme/color.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String? _disabilitytype;
  final List<String> disability_items = ['item 1', 'item 2', 'item 3'];
  String? _schemetype;
  final List<String> scheme_items = ['item 1', 'item 2', 'item 3'];
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
                  height: 40,
                  width: width / 1.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(
                            0x3f000000,
                          ), //New
                          blurRadius: 1.0,
                          offset: Offset(0, 0))
                    ],
                  ),
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
                          height: 30,
                          width: 30,
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
                    Container(
                      width: width,
                      decoration: BoxDecoration(
                          color: bgcolor,
                          borderRadius: BorderRadius.circular(5) //<-- SEE HERE
                          ),
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          underline: Container(
                            height: 0,
                          ),
                          elevation: 0,
                          borderRadius: BorderRadius.circular(5),
                          value: _disabilitytype,
                          onChanged: (String? newValue) {
                            setState(() {
                              _disabilitytype = newValue!;
                            });
                          },
                          items: disability_items.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          icon: Visibility(
                              visible: true,
                              child: Icon(
                                Icons.arrow_drop_down_outlined,
                                color: black,
                              )),
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
                    Container(
                      width: width,
                      decoration: BoxDecoration(
                          color: bgcolor,
                          borderRadius: BorderRadius.circular(5) //<-- SEE HERE
                          ),
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          underline: Container(
                            height: 0,
                          ),
                          elevation: 0,
                          borderRadius: BorderRadius.circular(5),
                          value: _schemetype,
                          onChanged: (String? newValue) {
                            setState(() {
                              _schemetype = newValue!;
                            });
                          },
                          items: scheme_items.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          icon: Visibility(
                              visible: true,
                              child: Icon(
                                Icons.arrow_drop_down_outlined,
                                color: black,
                              )),
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
                        onPressed: () async {},
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
