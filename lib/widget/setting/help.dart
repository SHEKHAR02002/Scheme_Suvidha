import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgcolor,
        leading: Icon(
          Icons.arrow_back_ios,
          color: black,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Help",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            )),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          TextField(
            maxLines: 8,
            keyboardType: TextInputType.multiline,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.transparent)),
                hintText: "write your query or feedback here..",
                hintStyle: TextStyle(
                  color: Color(
                    0xff9f9f9f,
                  ),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                )),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  fixedSize: Size(350, 55)),
              onPressed: () {},
              child: Text(
                "Send Query",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              )),
          SizedBox(height: 25),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  fixedSize: Size(350, 55)),
              onPressed: () {},
              child: Text(
                "Send Email",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ))
        ],
      )),
    );
  }
}
