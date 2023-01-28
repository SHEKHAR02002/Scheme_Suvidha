import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/model/schememodel.dart';
import 'package:scheme/widget/schemedetail.dart';

class SchemeCard extends StatefulWidget {
  final SchemeModel schemedata;
  final int index;
  const SchemeCard({super.key, required this.schemedata, required this.index});

  @override
  State<SchemeCard> createState() => _SchemeCardState();
}

class _SchemeCardState extends State<SchemeCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Column(
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
                  height: 28,
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
                    const SizedBox(
                      width: 8,
                    ),
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
                    const SizedBox(
                      width: 8,
                    ),
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
                )
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SchemeDetail(
                            schemedata: widget.schemedata,
                          ))),
              child: SvgPicture.asset(
                "assets/right_arrow.svg",
                color: black,
                height: 30,
                width: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
