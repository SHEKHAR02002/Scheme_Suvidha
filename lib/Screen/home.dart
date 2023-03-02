import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Screen/profile.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/model/schememodel.dart';
import 'package:scheme/model/usermodel.dart';
import 'package:scheme/provider/firebasehelper.dart';
import 'package:scheme/widget/alertcard.dart';
import 'package:scheme/widget/campcard.dart';
import 'package:scheme/widget/campdetail.dart';
import 'package:scheme/widget/donesplash.dart';
import 'package:scheme/widget/schemecard.dart';
import 'package:scheme/widget/search.dart';
import 'package:scheme/widget/statuscard.dart';
import 'package:scheme/widget/upload.dart';

ValueNotifier<List> schemeDataList = ValueNotifier<List>([]);

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserModel? user;
  bool loader = true;
  bool register = false;
  bool verification = false;
  int listlength = 3;
  List campdetail = [];

  checkregister() async {
    user = await FirebaseHelper.getUserModelById(
        uid: FirebaseAuth.instance.currentUser!.uid.toString());

    if (user!.registeration == true) {
      setState(() {
        register = true;
      });
    } else {
      setState(() {
        register = false;
      });
    }
  }

  getcampdetail() async {
    await FirebaseFirestore.instance
        .collection('Camps')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        campdetail.add(doc.data());
      }
    });
    print(campdetail);
  }

  @override
  void initState() {
    getcampdetail();
    checkregister();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Search())),
              child: SvgPicture.asset(
                "assets/search.svg",
                color: primary,
                height: 30,
                width: 30,
              ),
            ),
          ),
          backgroundColor: bgcolor,
          actions: [
            InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>DoneUpload())),
              child: SvgPicture.asset(
                "assets/notification.svg",
                color: Colors.black,
                height: 30,
                width: 30,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () =>
                  // register
                  //     ?
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profile(
                                user: user!,
                              ))),
              // : Fluttertoast.showToast(
              //     msg: "You Not Register",
              //     toastLength: Toast.LENGTH_LONG,
              //     fontSize: 20,
              //     backgroundColor: secondary,
              //     textColor: Colors.black),
              child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: user!.image == ""
                      ? CircleAvatar(
                          radius: 15,
                          child: Image.network(
                            "https://firebasestorage.googleapis.com/v0/b/scheme-suvidha-admin.appspot.com/o/miscellaneous%2Fdefalutprofile.png?alt=media&token=fbf2357d-d893-43a7-9bcc-412f454691c4",
                            fit: BoxFit.cover,
                          ),
                        )
                      : CircleAvatar(
                          radius: 15,
                          child: Image.network(
                            '${user!.image}',
                            fit: BoxFit.cover,
                          ),
                        )),
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatusCard(
                register: register,
                verify: verification,
              ),
              const SizedBox(height: 24),
              register == false?AlertCard():SizedBox.shrink(),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Schemes for all",
                    style: TextStyle(
                        color: black,
                        fontFamily: "Zilla",
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    "assets/filter.svg",
                    color: black,
                    height: 30,
                    width: 30,
                  ),
                ],
              ),
              

              const SizedBox(height: 30),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Schemes")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }
                    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                      List schemdata = List.from(snapshot.data!.docs
                          .map((doc) => SchemeModel.fromSnapshot(doc)));
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return SchemeCard(schemedata: schemdata[index]);
                          });
                    }
                    return const Center(child: Text("No Data"));
                  }),
              Text("show more.....",style: TextStyle(color: primary,fontSize: 16,fontWeight: FontWeight.w400),),
              const SizedBox(height: 30),
              const Text(
                "Campaigns",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Zilla"),
              ),
              const SizedBox(height: 30),
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  initialPage: 0,
                  autoPlay: false,
                  // height: ,
                  aspectRatio: 1/0.95,
                  autoPlayInterval: const Duration(seconds: 8),
                  autoPlayAnimationDuration:
                      const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: campdetail
                    .map((data) => CampCard(
                          image: data['image'],
                          title: data['Category'],
                          date: data['date'],
                          id: data['campid'],
                          place: data['place'],
                        ))
                    .toList(),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ));
        // bottomNavigationBar: register == false
        //     ? Padding(
        //         padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
        //         child: ElevatedButton(
        //             onPressed: () => Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => const UploadDoument())),
        //             style: ElevatedButton.styleFrom(
        //                 elevation: 0,
        //                 shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(5)),
        //                 backgroundColor: primary,
        //                 minimumSize: Size(width, 50)),
        //             child: const Text(
        //               "Register",
        //               style: TextStyle(
        //                   fontFamily: "Overpass",
        //                   fontSize: 18,
        //                   fontWeight: FontWeight.w700),
        //             )))
        //     : const SizedBox.shrink());
  }
}
