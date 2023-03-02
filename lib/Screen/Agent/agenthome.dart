import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Screen/Agent/registrationform.dart';
import 'package:scheme/Screen/agentwidget/applicationcard.dart';
import 'package:scheme/Screen/agentwidget/overvieewcard.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';

class AgentHome extends StatefulWidget {
  const AgentHome({super.key});

  @override
  State<AgentHome> createState() => _AgentHomeState();
}

class _AgentHomeState extends State<AgentHome> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          actions: [
            SvgPicture.asset(
              "assets/notification.svg",
              color: Colors.black,
              height: 30,
              width: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  radius: 15,
                  child: Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/scheme-suvidha-admin.appspot.com/o/miscellaneous%2Fdefalutprofile.png?alt=media&token=fbf2357d-d893-43a7-9bcc-412f454691c4",
                    fit: BoxFit.cover,
                  ),
                ))
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OverviewCard(),
              const SizedBox(height: 30),
              Text(
                'Applications',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500, color: primary),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const ApplicationCard();
                    }),
              )
            ],
          ),
        )));
  }
}
