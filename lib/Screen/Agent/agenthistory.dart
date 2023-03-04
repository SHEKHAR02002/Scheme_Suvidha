import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';

class AgentHistory extends StatefulWidget {
  const AgentHistory({super.key});

  @override
  State<AgentHistory> createState() => _AgentHistoryState();
}

class _AgentHistoryState extends State<AgentHistory> {
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
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Text(
          "History",
          style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w400,
              fontFamily: "Zilla"),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          children: [
            TabBar(
                labelColor: primary,
                unselectedLabelColor: Colors.black,
                labelStyle: const TextStyle(
                    fontFamily: "overpass",
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
                indicatorColor: primary,
                tabs: const [
                  Tab(
                    text: "Verified forms",
                  ),
                  Tab(
                    text: "Filled forms",
                  )
                ]),
            Expanded(
              child: TabBarView(children: [
                Stack(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(
                                0x3f000000,
                              ), //New
                              blurRadius: 1.0,
                              offset: Offset(0, 0))
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              child: Image.network(
                                "https://firebasestorage.googleapis.com/v0/b/scheme-suvidha-admin.appspot.com/o/miscellaneous%2Fdefalutprofile.png?alt=media&token=fbf2357d-d893-43a7-9bcc-412f454691c4",
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ADIP scheme",
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Applicant: Danny Danzoupa",
                                  style: const TextStyle(
                                      color: Color(
                                        0xff545454,
                                      ),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 20,
                    right: 20,
                    child: Text(
                      "05 March 23",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color(
                          0xff545454,
                        ),
                      ),
                    ),
                  )
                ]),
                Stack(children: [
                  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(
                                0x3f000000,
                              ), //New
                              blurRadius: 1.0,
                              offset: Offset(0, 0))
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              child: Image.network(
                                "https://firebasestorage.googleapis.com/v0/b/scheme-suvidha-admin.appspot.com/o/miscellaneous%2Fdefalutprofile.png?alt=media&token=fbf2357d-d893-43a7-9bcc-412f454691c4",
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "ADIP scheme",
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Applicant: Danny Danzoupa",
                                  style:  TextStyle(
                                      color: Color(
                                        0xff545454,
                                      ),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 20,
                    right: 20,
                    child: Text(
                      "05 March 23",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color(
                          0xff545454,
                        ),
                      ),
                    ),
                  )
                ])
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
