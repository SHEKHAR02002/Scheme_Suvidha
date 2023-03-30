import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Screen/Agent/agentbottomsheet.dart';
import 'package:scheme/Screen/schemedetail.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/model/schememodel.dart';

class SchemeCard extends StatefulWidget {
  final SchemeModel schemedata;
  final bool register;
  final bool agent;

  const SchemeCard(
      {super.key,
      required this.schemedata,
      required this.register,
      required this.agent});

  @override
  State<SchemeCard> createState() => _SchemeCardState();
}

class _SchemeCardState extends State<SchemeCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: width,
      decoration: shadowdecoration,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(10),
                  //   // child: CachedNetworkImage(
                  //   //     key: UniqueKey(),
                  //   //     cacheManager: customCacheManager,
                  //   //     height: 45,
                  //   //     width: 45,
                  //   //     fit: BoxFit.fill,
                  //   //     imageUrl: widget.schemedata.image.toString(),
                  //   //     placeholder: (context, url) =>
                  //   //         const CircularProgressIndicator()
                  //   //         )
                  // ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: width - 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.schemedata.schemename.toString(),
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              color: black,
                              fontFamily: "Overpass",
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          widget.schemedata.organizationname.toString(),
                          overflow: TextOverflow.ellipsis,
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
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 25,
                    width: width / 5,
                    decoration: BoxDecoration(
                        color: secondary,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        widget.schemedata.statename.toString() ==
                                "All State / UTs"
                            ? "All India"
                            : widget.schemedata.statename.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            overflow: TextOverflow.clip,
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          widget.schemedata.category.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    height: 25,
                    width: width / 5,
                    decoration: BoxDecoration(
                        color: secondary,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      widget.schemedata.disabilitypercentage.toString(),
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              )
            ],
          ),
          // const Spacer(),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => !widget.agent
                          ? SchemeDetail(
                              register: widget.register,
                              schemedata: widget.schemedata,
                            )
                          : const BottomNavigator()));
            },
            child: SvgPicture.asset(
              "assets/right_arrow.svg",
              color: black,
              height: 30,
              width: 30,
            ),
          ),
        ],
      ),
    );
  }
}
