import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';

class NotificationCenter extends StatefulWidget {
  const NotificationCenter({super.key});

  @override
  State<NotificationCenter> createState() => _NotificationCenterState();
}

class _NotificationCenterState extends State<NotificationCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: black,
          ),
        ),
        title: Text(
          "Notification",
          style: TextStyle(
              color: black,
              fontFamily: "Zilla",
              fontSize: 24,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Container(
              decoration: shadowdecoration,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                    "Registration Successful ! Now you can find your scheme"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // const ApplySchemeStatus()
          ],
        ),
      ),
    );
  }
}
