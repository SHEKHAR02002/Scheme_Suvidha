import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
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

  Future callApi() async {
    myapplication.clear();
    // application.clear();
    List temp = [];
    List temp1 = [];
    // temp.addAll(await getapplication());
    temp1.addAll(await getmyapplication());
    for (var items in myapplication) {
      temp1.removeWhere(
          (element) => element["Applicationid"] == items["Applicationid"]);
    }
    if (mounted) {
      setState(() {
        application.addAll(temp);

        if (application.isNotEmpty) {
          applicationloader = false;
        }

        myapplication.addAll(temp1);
        if (myapplication.isNotEmpty) {
          myapplicationloader = false;
        }
      });
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
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(21),
            child: Image.asset(
              "assets/logo.png",
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
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
        body: RefreshIndicator(
          onRefresh: callApi,
          child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const OverviewCard(),
                  application.isEmpty && myapplication.isEmpty
                      ? Center(
                          child: Column(
                            children: [
                              Text(
                                'My Applications',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: primary),
                              ),
                              Lottie.asset("animations/waiting.json",
                                  height: 200, width: 200),
                              const Text(
                                "Take a break !\nThere are no applications yet.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        )
                      : !myapplicationloader
                          ? Text(
                              'My Applications',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: primary),
                            )
                          : const SizedBox.shrink(),
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
                            userid: myapplications.userId.toString(),
                            applicationdetails: myapplications,
                          );
                        }),
                  ),
                  !applicationloader
                      ? Text(
                          'Applications',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: primary),
                        )
                      : const SizedBox.shrink(),
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
                            userid: applications.userId.toString(),
                            activate: false,
                            applicationdetails: applications,
                          );
                        }),
                  )
                ],
              )),
        ));
  }
}
