import 'package:flutter/material.dart';
import 'package:scheme/Screen/agentwidget/pdfviewer.dart';
import 'package:scheme/Theme/color.dart';

class DocumentVerification extends StatefulWidget {
  const DocumentVerification({super.key});

  @override
  State<DocumentVerification> createState() => _DocumentVerificationState();
}

class _DocumentVerificationState extends State<DocumentVerification> {
  @override
  Widget build(BuildContext context) {
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
                            "https://firebasestorage.googleapis.com/v0/b/petaraa-testing-7fa2f.appspot.com/o/Ngo%2F6SHLVclDRTch412EXfOMXSOKnHH2%2FConnect%20For_AddressProof.pdf?alt=media&token=720ccf02-f410-4432-80fc-d0d9f084f283";
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                    onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
