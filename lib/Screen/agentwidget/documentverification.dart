import 'package:flutter/material.dart';
import 'package:scheme/Screen/Agent/agentbottomsheet.dart';
import 'package:scheme/Screen/agentwidget/pdfviewer.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/api/agentfuncation.dart';
import 'package:scheme/model/usermodel.dart';
import 'package:scheme/widget/processingpopup.dart';

class DocumentVerification extends StatefulWidget {
  final UserModel applicationdetails;
  const DocumentVerification({super.key, required this.applicationdetails});

  @override
  State<DocumentVerification> createState() => _DocumentVerificationState();
}

class _DocumentVerificationState extends State<DocumentVerification> {
  final TextEditingController _msg = TextEditingController();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Address Proof",
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
                      setState(() {
                        pdfname = 'Address Proof';
                        pdfpath =
                            widget.applicationdetails.addresspdf.toString();
                        // "https://firebasestorage.googleapis.com/v0/b/scheme-suvidha-admin.appspot.com/o/x46OOatKangPSUUJE0qcxhZgvwP2%2FAadress%20Proof?alt=media&token=6b70e2ce-306a-4820-9e51-e9d0befe946c";
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PDFViewer()));
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
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  "Age Proof",
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
                      setState(() {
                        pdfname = 'Age Proof';
                        pdfpath = widget.applicationdetails.agepdf.toString();
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PDFViewer()));
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
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  "Domacile Proof",
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
                      setState(() {
                        pdfname = 'Domacile Proof';
                        pdfpath =
                            widget.applicationdetails.domacilepdf.toString();
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PDFViewer()));
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
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  "Income Proof",
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
                      setState(() {
                        pdfname = 'Income Proof';
                        pdfpath =
                            widget.applicationdetails.incomepdf.toString();
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PDFViewer()));
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
            const SizedBox(
              height: 20,
            ),
            widget.applicationdetails.lastyearpdf != ""
                ? Row(
                    children: [
                      const Text(
                        "Income Proof",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
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
                            setState(() {
                              pdfname = 'Last Year Passing Proof';
                              pdfpath = widget.applicationdetails.lastyearpdf
                                  .toString();
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PDFViewer()));
                          },
                          child: const Text(
                            "View",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ))
                    ],
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              height: 20,
            ),
            widget.applicationdetails.parentpdf != ""
                ? Row(
                    children: [
                      const Text(
                        "Parent Id Proof",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
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
                            setState(() {
                              pdfname = 'Parent ID Proof';
                              pdfpath = widget.applicationdetails.parentpdf
                                  .toString();
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PDFViewer()));
                          },
                          child: const Text(
                            "View",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ))
                    ],
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              height: 50,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: ElevatedButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (c) => processingPopup(
                              context: context,
                              msg: "Acceptng the User Documents"));
                      await verifyUser(
                              accepted: true,
                              userId:
                                  widget.applicationdetails.userId.toString())
                          .whenComplete(() => Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const BottomNavigator()),
                              (route) => false));
                    },

                    // upload(),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: primary,
                        minimumSize: Size(width, 40)),
                    child: const Text(
                      "Accept",
                      style: TextStyle(
                          fontFamily: "Overpass",
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ))),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) => Dialog(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Review",
                                          style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: TextField(
                                            controller: _msg,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400),
                                            decoration: InputDecoration(
                                              hintText:
                                                  "Write a review for rejection",
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 10),
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: primary,
                                                fixedSize: Size(width, 40)),
                                            onPressed: () async {
                                              showDialog(
                                                  context: context,
                                                  builder: (c) => processingPopup(
                                                      context: context,
                                                      msg:
                                                          "Rejecting the User Documents"));
                                              await verifyUser(
                                                      accepted: false,
                                                      msg: _msg.text,
                                                      userId: widget
                                                          .applicationdetails
                                                          .userId
                                                          .toString())
                                                  .whenComplete(() => Navigator
                                                      .pushAndRemoveUntil(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const BottomNavigator()),
                                                          (route) => false));
                                            },
                                            child:
                                                const Text("Send the Review"))
                                      ]),
                                ),
                              ));
                    },

                    // upload(),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: primary,
                        minimumSize: Size(width, 40)),
                    child: const Text(
                      "Reject",
                      style: TextStyle(
                          fontFamily: "Overpass",
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ))),
          ],
        ),
      ),
    );
  }
}
