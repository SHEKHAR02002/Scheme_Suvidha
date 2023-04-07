import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Screen/Agent/agentnotification.dart';
import 'package:scheme/Screen/agentwidget/applicationcard.dart';
import 'package:scheme/Screen/agentwidget/overvieewcard.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/api/getscheme.dart';
import 'package:scheme/model/usermodel.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';

class AgentHome extends StatefulWidget {
  const AgentHome({super.key});

  @override
  State<AgentHome> createState() => _AgentHomeState();
}

class _AgentHomeState extends State<AgentHome> {
  bool applicationloader = true;
  List application = [];

  Future callApi() async {
    application.clear();
    application.addAll(await getapplication());
    if (mounted) {
      setState(() {
        if (application.isNotEmpty) {
          applicationloader = false;
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
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AgentNotification(),
                  )),
              child: SvgPicture.asset(
                "assets/notification.svg",
                color: Colors.black,
                height: 30,
                width: 30,
              ),
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SvgPicture.asset(
                  "assets/about.svg",
                  color: Colors.black,
                  height: 30,
                  width: 30,
                ),
              ),
            )
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
                  const SizedBox(height: 30),
                  application.isEmpty
                      ? Center(
                          child: Column(
                            children: [
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
                      : const SizedBox.shrink(),
                  //     : !myapplicationloader
                  //         ? Text(
                  //             'My Applications',
                  //             style: TextStyle(
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.w500,
                  //                 color: primary),
                  //           )
                  //         : const SizedBox.shrink(),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 15),
                  //   child: ListView.builder(
                  //       shrinkWrap: true,
                  //       physics: const NeverScrollableScrollPhysics(),
                  //       itemCount: myapplication.length,
                  //       itemBuilder: (context, index) {
                  //         UserModel myapplications =
                  //             UserModel.fromMap(myapplication[index]);
                  //         return ApplicationCard(
                  //           activate: true,
                  //           userid: myapplications.userId.toString(),
                  //           applicationdetails: myapplications,
                  //         );
                  //       }),
                  // ),
                  !applicationloader
                      ? Text(
                          'Applications',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: primary),
                        )
                      : const SizedBox.shrink(),
                  !applicationloader
                      ? Padding(
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
                      : const SizedBox.shrink()
                ],
              )),
        ));
  }
}
