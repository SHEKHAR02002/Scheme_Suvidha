import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Screen/profile.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/api/getscheme.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/model/schememodel.dart';
import 'package:scheme/widget/alertcard.dart';
import 'package:scheme/widget/campcard.dart';
import 'package:scheme/widget/donesplash.dart';
import 'package:scheme/widget/schemecard.dart';
import 'package:scheme/widget/search.dart';
import 'package:scheme/widget/statuscard.dart';

ValueNotifier<List> schemeDataList = ValueNotifier<List>([]);

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // UserModel? user;
  bool campLoader = true, schemeLoader = true;
  bool register = userDetail!.registeration!;
  bool verification = false;
  int listlength = 3;
  int nowlistlength = 0;
  List campdetail = [], schemesDetails = [];
  bool nomore = false;

  Future getcampdetail() async {
    await FirebaseFirestore.instance
        .collection('Camps')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        campdetail.add(doc.data());
      }
    });
    // print(campdetail);
  }

  Future callApi() async {
    // await checkregister();
    await getcampdetail();
    schemesDetails.addAll(await getSchemes());
    print(campdetail);
    print(schemesDetails);
    if (mounted) {
      if (campdetail.isNotEmpty) {
        setState(() {
          campLoader = false;
        });
      }
      if (schemesDetails.isNotEmpty) {
        setState(() {
          schemeLoader = false;
        });
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
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DoneUpload())),
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
                                user: userDetail!,
                              ))),
              // : Fluttertoast.showToast(
              //     msg: "You Not Register",
              //     toastLength: Toast.LENGTH_LONG,
              //     fontSize: 20,
              //     backgroundColor: secondary,
              //     textColor: Colors.black),
              child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: userDetail!.image == ""
                      ? CircleAvatar(
                          radius: 15,
                          child: Image.network(
                            defaultPic,
                            fit: BoxFit.cover,
                          ),
                        )
                      : CircleAvatar(
                          radius: 15,
                          child: Image.network(
                            '${userDetail!.image}',
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
              register == false ? const AlertCard() : const SizedBox.shrink(),
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
              // StreamBuilder(
              //     stream: FirebaseFirestore.instance
              //         .collection("Schemes")
              //         .snapshots(),
              //     builder: (context, snapshot) {
              //       if (snapshot.hasError) {
              //         return const Text('Something went wrong');
              //       }
              //       if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              //         List schemdata = List.from(snapshot.data!.docs
              //             .map((doc) => SchemeModel.fromSnapshot(doc)));
              //         return ListView.builder(
              //             shrinkWrap: true,
              //             physics: const NeverScrollableScrollPhysics(),
              //             itemCount: 2,
              //             itemBuilder: (context, index) {
              //               return SchemeCard(schemedata: schemdata[index]);
              //             });
              //       }
              //       return const Center(child: Text("No Data"));
              //     }),
              schemeLoader
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listlength,
                      itemBuilder: (context, index) {
                        SchemeModel schemdata =
                            SchemeModel.fromMap(schemesDetails[index]);
                        return SchemeCard(schemedata: schemdata,register: register,);
                      }),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () { 
                    // nomore?
                    //  setState(() {
                    //   listlength =3;
                    //   nomore = false;
                    //  })
                    // :
                    setState(() {
                    if (schemesDetails.length > listlength) {
                      nowlistlength += 5;
                      if(nowlistlength>schemesDetails.length){
                        setState(() {
                          listlength = schemesDetails.length;
                        });
                      }
                      else{
                        listlength = nowlistlength;
                      }
                    }
                    else{
                      setState(() {   
                      listlength = schemesDetails.length;
                      nomore = true;
                      });
                    }
                  });

                  },
                  child: Text(
                    nomore?"Less...": "More...",
                    style: TextStyle(
                        color: primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Campaigns",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Zilla"),
              ),
              const SizedBox(height: 30),
              campLoader
                  ? const Center(child: CircularProgressIndicator())
                  : CarouselSlider(
                      options: CarouselOptions(
                        viewportFraction: 1,
                        initialPage: 0,
                        autoPlay: false,
                        // height: ,
                        aspectRatio: 1 / 0.95,
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
              const SizedBox(
                height: 20,
              )
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
