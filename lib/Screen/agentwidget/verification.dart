import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheme/Screen/agentwidget/udidverification.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/model/usermodel.dart';

class AgentVerification extends StatefulWidget {
  final UserModel applicationdetails;
  const AgentVerification({super.key, required this.applicationdetails});

  @override
  State<AgentVerification> createState() => _AgentVerificationState();
}

class _AgentVerificationState extends State<AgentVerification> {
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
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Text(
          "Verification",
          style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w400,
              fontFamily: "Zilla"),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/scheme-suvidha-admin.appspot.com/o/miscellaneous%2Fdefalutprofile.png?alt=media&token=fbf2357d-d893-43a7-9bcc-412f454691c4",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.applicationdetails.name.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      widget.applicationdetails.applyschemename.toString(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: text2),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Aadhar Card Details",
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
                  "Aadhar Card",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: primary,
                        minimumSize: Size(80, 30)),
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
            const SizedBox(height: 30),
            TextContainer(
                title: "Aadhar Card No",
                content: widget.applicationdetails.aadharno.toString()),
            const SizedBox(height: 15),
            TextContainer(
                title: "Name",
                content: widget.applicationdetails.name.toString()),
            const SizedBox(height: 15),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "DOB",
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
                          hintText: widget.applicationdetails.dob.toString(),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
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
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Gender",
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
                          hintText: widget.applicationdetails.gender.toString(),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
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
            const SizedBox(height: 15),
            TextContainer(
                title: "Phone No.",
                content: widget.applicationdetails.phoneno.toString())
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          child: ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UDIDVerification(applicationdetails: widget.applicationdetails,))),

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

class TextContainer extends StatefulWidget {
  final String title, content;
  const TextContainer({super.key, required this.title, required this.content});

  @override
  State<TextContainer> createState() => _TextContainerState();
}

class _TextContainerState extends State<TextContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        Container(
          height: 40,
          decoration: shadowdecoration,
          child: TextField(
            // keyboardType: TextInputType.number,
            readOnly: true,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              hintText: widget.content,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
      ],
    );
  }
}
