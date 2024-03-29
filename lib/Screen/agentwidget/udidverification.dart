import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:scheme/Screen/agentwidget/documentverification.dart';
import 'package:scheme/Screen/agentwidget/verification.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/model/usermodel.dart';

class UDIDVerification extends StatefulWidget {
  final UserModel applicationdetails;
  const UDIDVerification({super.key, required this.applicationdetails});

  @override
  State<UDIDVerification> createState() => _UDIDVerificationState();
}

class _UDIDVerificationState extends State<UDIDVerification> {
  // final TextEditingController _msg = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: const Text(
          "Verification",
          style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w400,
              fontFamily: "Zilla"),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "UDID Card Details",
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w400, color: primary),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Icon(
                  Icons.image_outlined,
                  size: 30,
                ),
                const Text(
                  "UDID Card",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: primary,
                        minimumSize: const Size(80, 30)),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) => Dialog(
                                  child: ExtendedImage.network(
                                widget.applicationdetails.udidimage.toString(),
                                fit: BoxFit.fill,
                                mode: ExtendedImageMode.gesture,

                                cache: true,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30.0)),
                                //cancelToken: cancellationToken,
                              )));
                    },
                    child: const Text(
                      "View",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ))
              ],
            ),
            const SizedBox(height: 30),
            TextContainer(
                title: "UDID Card No.",
                content: widget.applicationdetails.udidno.toString()),
            // const SizedBox(height: 15),
            // TextContainer(
            //     title: "Name",
            //     content: widget.applicationdetails.udidname.toString()),
            const SizedBox(height: 15),
            TextContainer(
                title: "Disability Type",
                content: widget.applicationdetails.disabilitytype.toString()),
            const SizedBox(height: 15),
            TextContainer(
                title: "Disability Percentage",
                content:
                    widget.applicationdetails.disabilitypercentage.toString()),
            const SizedBox(height: 15),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Date Of Issue",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Container(
                      height: 40,
                      width: width / 2.5,
                      decoration: shadowdecoration,
                      child: TextField(
                        // keyboardType: TextInputType.number,
                        readOnly: true,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          hintText: widget.applicationdetails.dateissue,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Valid Upto",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Container(
                      height: 40,
                      width: width / 2.5,
                      decoration: shadowdecoration,
                      child: TextField(
                        // keyboardType: TextInputType.number,
                        readOnly: true,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          hintText: widget.applicationdetails.validupto,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // Padding(
            //     padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            //     child: ElevatedButton(
            //         onPressed: () async {
            //           showDialog(
            //               context: context,
            //               builder: (c) => processingPopup(
            //                   context: context,
            //                   msg: "Acceptng the User Documents"));
            //           await verifyUser(
            //                   accepted: true,
            //                   userId:
            //                       widget.applicationdetails.userId.toString())
            //               .whenComplete(() => Navigator.pushAndRemoveUntil(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) =>
            //                           const BottomNavigator()),
            //                   (route) => false));
            //         },

            //         // upload(),
            //         style: ElevatedButton.styleFrom(
            //             elevation: 0,
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(5)),
            //             backgroundColor: primary,
            //             minimumSize: Size(width, 40)),
            //         child: const Text(
            //           "Accept",
            //           style: TextStyle(
            //               fontFamily: "Overpass",
            //               fontSize: 18,
            //               fontWeight: FontWeight.w700),
            //         ))),
            // Padding(
            //     padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            //     child: ElevatedButton(
            //         onPressed: () {
            //           showDialog(
            //               context: context,
            //               builder: (_) => Dialog(
            //                     child: Padding(
            //                       padding: const EdgeInsets.all(10),
            //                       child: Column(
            //                           mainAxisSize: MainAxisSize.min,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             const Text(
            //                               "Review",
            //                               style: TextStyle(
            //                                   fontSize: 28,
            //                                   fontWeight: FontWeight.w500),
            //                             ),
            //                             Padding(
            //                               padding: const EdgeInsets.symmetric(
            //                                   vertical: 20),
            //                               child: TextField(
            //                                 controller: _msg,
            //                                 style: const TextStyle(
            //                                     fontSize: 18,
            //                                     fontWeight: FontWeight.w400),
            //                                 decoration: InputDecoration(
            //                                   hintText:
            //                                       "Write a review for rejection",
            //                                   contentPadding:
            //                                       const EdgeInsets.symmetric(
            //                                           vertical: 10,
            //                                           horizontal: 10),
            //                                   filled: true,
            //                                   fillColor: Colors.white,
            //                                   border: OutlineInputBorder(
            //                                       borderSide: const BorderSide(
            //                                           width: 1),
            //                                       borderRadius:
            //                                           BorderRadius.circular(5)),
            //                                 ),
            //                               ),
            //                             ),
            //                             ElevatedButton(
            //                                 style: ElevatedButton.styleFrom(
            //                                     backgroundColor: primary,
            //                                     fixedSize: Size(width, 40)),
            //                                 onPressed: () async {
            //                                   showDialog(
            //                                       context: context,
            //                                       builder: (c) => processingPopup(
            //                                           context: context,
            //                                           msg:
            //                                               "Rejecting the User Documents"));
            //                                   await verifyUser(
            //                                           accepted: false,
            //                                           msg: _msg.text,
            //                                           userId: widget
            //                                               .applicationdetails
            //                                               .userId
            //                                               .toString())
            //                                       .whenComplete(() => Navigator
            //                                           .pushAndRemoveUntil(
            //                                               context,
            //                                               MaterialPageRoute(
            //                                                   builder: (context) =>
            //                                                       const BottomNavigator()),
            //                                               (route) => false));
            //                                 },
            //                                 child:
            //                                     const Text("Send the Review"))
            //                           ]),
            //                     ),
            //                   ));
            //         },

            //         // upload(),
            //         style: ElevatedButton.styleFrom(
            //             elevation: 0,
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(5)),
            //             backgroundColor: primary,
            //             minimumSize: Size(width, 40)),
            //         child: const Text(
            //           "Reject",
            //           style: TextStyle(
            //               fontFamily: "Overpass",
            //               fontSize: 18,
            //               fontWeight: FontWeight.w700),
            //         ))),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          child: ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DocumentVerification(
                            applicationdetails: widget.applicationdetails,
                          ))),

              // upload(),
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
              ))),
    );
  }
}
