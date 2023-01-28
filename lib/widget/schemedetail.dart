import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/model/schememodel.dart';

class SchemeDetail extends StatefulWidget {
  final SchemeModel schemedata;
  const SchemeDetail({super.key, required this.schemedata});

  @override
  State<SchemeDetail> createState() => _SchemeDetailState();
}

class _SchemeDetailState extends State<SchemeDetail> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: bgcolor,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: black,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Scheme Details",
            style: TextStyle(
                color: black,
                fontFamily: "Zilla",
                fontSize: 22,
                fontWeight: FontWeight.w400),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                            key: UniqueKey(),
                            cacheManager: customCacheManager,
                            height: 45,
                            width: 45,
                            fit: BoxFit.fill,
                            imageUrl: widget.schemedata.image.toString(),
                            placeholder: (context, url) =>
                                const CircularProgressIndicator())),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.schemedata.name.toString(),
                          style: TextStyle(
                              color: black,
                              fontFamily: "Overpass",
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          widget.schemedata.organization.toString(),
                          style: const TextStyle(
                              color: Color(
                                0x72000000,
                              ),
                              fontFamily: "Overpass",
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(
                      0x72d9d9d9,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  height: 50,
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      SvgPicture.asset(
                        "assets/verified.svg",
                        height: 30,
                        width: 30,
                      ),
                      const Text(
                        'Verify By Government of India On 20 Apr 1999',
                        style: TextStyle(
                            fontFamily: 'Overpass',
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      )
                    ]),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Divider(
                    color: Color(
                      0x72d9d9d9,
                    ),
                    thickness: 2,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 25,
                      width: width / 5,
                      decoration: BoxDecoration(
                          color: secondary,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          widget.schemedata.requirement1.toString(),
                          style: TextStyle(
                              color: black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 25,
                      width: width / 5,
                      decoration: BoxDecoration(
                          color: secondary,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          widget.schemedata.requirement2.toString(),
                          style: TextStyle(
                              color: black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 25,
                      width: width / 5,
                      decoration: BoxDecoration(
                          color: secondary,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          widget.schemedata.requirement3.toString(),
                          style: TextStyle(
                              color: black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "Description",
                  style: TextStyle(
                      fontFamily: 'Overpass',
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 4),
                  child: Text(
                    widget.schemedata.description.toString(),
                    style: const TextStyle(
                        fontFamily: 'Overpass',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "Eligibility Criteria",
                  style: TextStyle(
                      fontFamily: 'Overpass',
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 4),
                  child: Text(
                    widget.schemedata.eligibilty.toString(),
                    style: const TextStyle(
                        fontFamily: 'Overpass',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "Benifits",
                  style: TextStyle(
                      fontFamily: 'Overpass',
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 4),
                  child: Text(
                    widget.schemedata.benifits.toString(),
                    style: const TextStyle(
                        fontFamily: 'Overpass',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "More",
                  style: TextStyle(
                      fontFamily: 'Overpass',
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 4),
                  child: Text(
                    widget.schemedata.more.toString(),
                    style: const TextStyle(
                        fontFamily: 'Overpass',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
            child: ElevatedButton(
                onPressed: () {},
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
                ))));
  }
}
