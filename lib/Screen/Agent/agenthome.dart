import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Screen/agentwidget/applicationcard.dart';
import 'package:scheme/Screen/agentwidget/overvieewcard.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/api/getuserdetail.dart';
import 'package:scheme/model/usermodel.dart';

class AgentHome extends StatefulWidget {
  const AgentHome({super.key});

  @override
  State<AgentHome> createState() => _AgentHomeState();
}

class _AgentHomeState extends State<AgentHome> {
  bool applicationloader = true;
  bool myapplicationloader = true;
  List application = [];
  List myapplication = [];

  callApi() async {
    List temp = [];
    List temp1 = [];
    temp.addAll(await getapplication());
    if (mounted) {
      setState(() {
        application.addAll(temp);
      });
    }
    if (mounted) {
      if (application.isNotEmpty) {
        applicationloader = false;
        print(application);
      } else {
        print("empty");
      }
    }

    temp1.addAll(await getmyapplication());
    if (mounted) {
      setState(() {
        myapplication.addAll(temp1);
      });
    }
    if (mounted) {
      if (myapplication.isNotEmpty) {
        myapplicationloader = false;
        print(myapplication);
      } else {
        print("empty");
      }
    }
  }

  @override
  void initState() {
    callApi();
    super.initState();
  }

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
            applicationloader
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset(
                      "assets/about.svg",
                      color: Colors.black,
                      height: 30,
                      width: 30,
                    ),
                  )
                : const SizedBox.shrink()
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
                'My Applications',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500, color: primary),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: myapplication.length,
                    itemBuilder: (context, index) {
                      UserModel myapplications =
                          UserModel.fromMap(myapplication[index]);
                      return ApplicationCard(
                        activate: true,
                        applicationdetails: myapplications,
                      );
                    }),
              ),
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
                    itemCount: application.length,
                    itemBuilder: (context, index) {
                      UserModel applications =
                          UserModel.fromMap(application[index]);
                      return ApplicationCard(
                        activate: false,
                        applicationdetails: applications,
                      );
                    }),
              )
            ],
          ),
        )));
  }
}
