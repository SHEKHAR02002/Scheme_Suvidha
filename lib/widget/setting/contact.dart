import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/widget/faq.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
          "Contact Us",
          style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w400,
              fontFamily: "Zilla"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Support",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                  "Didn’t find the answer you were looking for ? Contact our Support Center?",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400, color: text2)),
              SizedBox(
                height: 30,
              ),
              Stack(children: [
                SizedBox(
                  width: width / 1.6,
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.globe,
                        size: 30,
                        color: primary,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Go to Our Website",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                Positioned(
                    bottom: 15,
                    right: 32,
                    child: Icon(
                      CupertinoIcons.escape,
                      size: 16,
                      color: primary,
                    ))
              ]),
              SizedBox(
                height: 24,
              ),
              Stack(children: [
                SizedBox(
                  width: width / 2.4,
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.envelope,
                        size: 30,
                        color: primary,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Email Us",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                Positioned(
                    bottom: 15,
                    right: 32,
                    child: Icon(
                      CupertinoIcons.escape,
                      size: 16,
                      color: primary,
                    ))
              ]),
              SizedBox(
                height: 40,
              ),
              const Text(
                "FAQ",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20,),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return FAQ(
                      question: "In what format the documents are to be uploaded?",
                      answer: "",
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
