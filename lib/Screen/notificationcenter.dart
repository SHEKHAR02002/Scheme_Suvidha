import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';

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
    );
  }
}
