import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheme/Screen/Agent/agentbottomsheet.dart';
import 'package:scheme/Screen/schemedetail.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/model/schememodel.dart';
import 'package:scheme/provider/googletranslator.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SchemeCard extends StatefulWidget {
  final SchemeModel schemedata;
  final bool register;
  final bool agent;
  final bool verification;

  const SchemeCard(
      {super.key,
      required this.schemedata,
      required this.register,
      required this.agent,
      required this.verification});

  @override
  State<SchemeCard> createState() => _SchemeCardState();
}

class _SchemeCardState extends State<SchemeCard> {
  String name = "", orgName = "", state = "", type = "";

  callApi() async {
    String tempName = await TranslationService().translate(
        text: widget.schemedata.schemename.toString(), targetLanguage: "Hi");
    String temporgName = await TranslationService().translate(
        text: widget.schemedata.organizationname.toString(),
        targetLanguage: "Hi");
    String tempState = await TranslationService().translate(
        text: widget.schemedata.statename.toString() == "All State / UTs" ||
                widget.schemedata.statename.toString() ==
                    "All State & Govenment of India"
            ? "All State"
            : widget.schemedata.statename.toString(),
        targetLanguage: "Hi");
    String temptype = await TranslationService().translate(
        text: widget.schemedata.category.toString() ==
                "Health & for purchase of aids"
            ? "Health"
            : widget.schemedata.category.toString(),
        targetLanguage: "Hi");
    setState(() {
      name = tempName;
      orgName = temporgName;
      state = tempState;
      type = temptype;
    });
  }

  @override
  void initState() {
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => !widget.agent
                  ? SchemeDetail(
                      verification: widget.verification,
                      register: widget.register,
                      schemedata: widget.schemedata,
                    )
                  : const BottomNavigator())),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: shadowdecoration,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: shadowdecoration,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                        key: UniqueKey(),
                        cacheManager: customCacheManager,
                        height: 80,
                        width: 74,
                        fit: BoxFit.fill,
                        imageUrl: organizationpic,
                        placeholder: (context, url) => SkeletonAnimation(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[300]),
                                height: 80,
                                width: 74,
                              ),
                            ))),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: width - 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      turnOnGOOGleAPI
                          ? name
                          : widget.schemedata.schemename.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontFamily: "Zilla",
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      turnOnGOOGleAPI
                          ? orgName
                          : widget.schemedata.organizationname.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: text2),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.circle_fill,
                          size: 9,
                          color: primary,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          turnOnGOOGleAPI
                              ? state
                              : widget.schemedata.statename.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: width / 18,
                        ),
                        Icon(
                          CupertinoIcons.circle_fill,
                          size: 9,
                          color: primary,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          turnOnGOOGleAPI
                              ? type
                              : widget.schemedata.disabilitytype.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
    // Container(
    //   margin: const EdgeInsets.symmetric(vertical: 10),
    //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    //   width: width,
    //   decoration: shadowdecoration,
    //   child: Row(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Column(
    //         mainAxisSize: MainAxisSize.min,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Row(
    //             children: [
    //               // ClipRRect(
    //               //   borderRadius: BorderRadius.circular(10),
    //               //   // child: CachedNetworkImage(
    //               //   //     key: UniqueKey(),
    //               //   //     cacheManager: customCacheManager,
    //               //   //     height: 45,
    //               //   //     width: 45,
    //               //   //     fit: BoxFit.fill,
    //               //   //     imageUrl: widget.schemedata.image.toString(),
    //               //   //     placeholder: (context, url) =>
    //               //   //         const CircularProgressIndicator()
    //               //   //         )
    //               // ),
    //               const SizedBox(
    //                 width: 10,
    //               ),
    //               SizedBox(
    //                 width: width - 100,
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       widget.schemedata.schemename.toString(),
    //                       overflow: TextOverflow.fade,
    //                       style: TextStyle(
    //                           color: black,
    //                           fontFamily: "Overpass",
    //                           fontSize: 14,
    //                           fontWeight: FontWeight.w600),
    //                     ),
    //                     Text(
    //                       widget.schemedata.organizationname.toString(),
    //                       overflow: TextOverflow.ellipsis,
    //                       style: const TextStyle(
    //                           color: Color(
    //                             0x72000000,
    //                           ),
    //                           fontFamily: "Overpass",
    //                           fontSize: 14,
    //                           fontWeight: FontWeight.w400),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //           const SizedBox(
    //             height: 28,
    //           ),
    //           Row(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               Container(
    //                 height: 25,
    //                 width: width / 5,
    //                 decoration: BoxDecoration(
    //                     color: secondary,
    //                     borderRadius: BorderRadius.circular(5)),
    //                 child: Padding(
    //                   padding: const EdgeInsets.symmetric(
    //                       vertical: 5, horizontal: 10),
    //                   child: Text(
    //                     widget.schemedata.statename.toString() ==
    //                             "All State / UTs"
    //                         ? "All India"
    //                         : widget.schemedata.statename.toString(),
    //                     textAlign: TextAlign.center,
    //                     style: TextStyle(
    //                         overflow: TextOverflow.clip,
    //                         color: black,
    //                         fontSize: 12,
    //                         fontWeight: FontWeight.w400),
    //                   ),
    //                 ),
    //               ),
    //               const SizedBox(
    //                 width: 8,
    //               ),
    //               Container(
    //                 height: 25,
    //                 width: width / 5,
    //                 decoration: BoxDecoration(
    //                     color: secondary,
    //                     borderRadius: BorderRadius.circular(5)),
    //                 child: Center(
    //                   child: Padding(
    //                     padding: const EdgeInsets.symmetric(
    //                         vertical: 5, horizontal: 10),
    //                     child: Text(
    //                       widget.schemedata.category.toString(),
    //                       textAlign: TextAlign.center,
    //                       style: TextStyle(
    //                           color: black,
    //                           fontSize: 12,
    //                           fontWeight: FontWeight.w400),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               const SizedBox(
    //                 width: 8,
    //               ),
    //               Container(
    //                 padding:
    //                     const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    //                 height: 25,
    //                 width: width / 5,
    //                 decoration: BoxDecoration(
    //                     color: secondary,
    //                     borderRadius: BorderRadius.circular(5)),
    //                 child: Text(
    //                   widget.schemedata.disabilitypercentage.toString(),
    //                   overflow: TextOverflow.fade,
    //                   textAlign: TextAlign.center,
    //                   style: TextStyle(
    //                       color: black,
    //                       fontSize: 12,
    //                       fontWeight: FontWeight.w400),
    //                 ),
    //               )
    //             ],
    //           )
    //         ],
    //       ),
    //       // const Spacer(),
    //       InkWell(
    //         onTap: () {
    //           Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                   builder: (context) => !widget.agent
    //                       ? SchemeDetail(
    //                           register: widget.register,
    //                           schemedata: widget.schemedata,
    //                         )
    //                       : const BottomNavigator()));
    //         },
    //         child: SvgPicture.asset(
    //           "assets/right_arrow.svg",
    //           color: black,
    //           height: 30,
    //           width: 30,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
