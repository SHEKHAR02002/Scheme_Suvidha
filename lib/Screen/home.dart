import 'package:flutter/material.dart';
import 'package:scheme/Screen/upload_addhar.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/provider/phoneauth.dart';
import 'package:scheme/widget/main_drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      drawer: const Drawer(child: MainDrawer()),
      appBar: AppBar(
        iconTheme: IconThemeData(color: text1),
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundColor: bgcolor,
            child: Icon(
              size: 30,
              Icons.notifications_none,
              color: text1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: bgcolor,
              radius: 30,
              child: Icon(
                size: 30,
                Icons.account_circle,
                color: text1,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 335,
                height: 80,
                child: Text(
                  "Welcome back\nMr.Alice",
                  style: TextStyle(
                    color: text1,
                    fontSize: 30,
                    fontFamily: 'Overpass',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 335,
                height: 126,
                decoration: BoxDecoration(
                  color: hcontainer,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(
                        0x3f000000,
                      ),
                      offset: Offset(
                        0,
                        0,
                      ),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        " Status",
                        style: TextStyle(
                          color: text1,
                          fontSize: 25,
                          fontFamily: 'Overpass',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        " Scheme name: NA\n Registration:NA\n Verification:NA",
                        style: TextStyle(
                          color: text2,
                          fontSize: 20,
                          fontFamily: 'Overpass',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Container(
                    width: 165,
                    height: 150,
                    decoration: BoxDecoration(
                      color: hcontainer,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(
                            0x3f000000,
                          ),
                          offset: Offset(
                            0,
                            0,
                          ),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Latest Scheme",
                            style: TextStyle(
                              color: text1,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Overpass",
                              letterSpacing: 0.4,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Text(
                                "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 .",
                                style: TextStyle(
                                  color: text2,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Overpass",
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 165,
                    height: 150,
                    decoration: BoxDecoration(
                      color: hcontainer,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(
                            0x3f000000,
                          ),
                          offset: Offset(
                            0,
                            0,
                          ),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "About Scheme",
                            style: TextStyle(
                              color: text1,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Overpass",
                              letterSpacing: 0.4,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Text(
                                "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 .",
                                style: TextStyle(
                                  color: text2,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Overpass",
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                width: 335,
                height: 126,
                decoration: BoxDecoration(
                  color: hcontainer,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(
                        0x3f000000,
                      ),
                      offset: Offset(
                        0,
                        0,
                      ),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DashBoard",
                            style: TextStyle(
                              color: text1,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Overpass",
                              letterSpacing: 0.4,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Total Scheme : 48",
                            style: TextStyle(
                              color: text2,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Overpass",
                              letterSpacing: 0.4,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Total Registration : 0",
                            style: TextStyle(
                              color: text2,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Overpass",
                              letterSpacing: 0.4,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "More....",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: text2,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Overpass",
                              letterSpacing: 0.4,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 100,
                        width: 120,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/graph.png')),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(250, 50),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: button),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AadharUpload()));
                  },
                  child: const Text(
                    "Registration",
                    style: TextStyle(
                        fontFamily: 'Overpass',
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(250, 50),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: button),
                  onPressed: () => PhoneAuth().logOut(context: context),
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                        fontFamily: 'Overpass',
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
