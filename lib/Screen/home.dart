import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Screen/agentwidget/filtercontainer.dart';
import 'package:scheme/Screen/profile.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/api/getscheme.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/model/schememodel.dart';
import 'package:scheme/widget/alertcard.dart';
import 'package:scheme/widget/campcard.dart';
import 'package:scheme/widget/imagesourcepopup.dart';
import 'package:scheme/widget/registrationalertpopup.dart';
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
  bool campLoader = true, schemeLoader = true, filterclicked = false;
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

  Future getFilter({required String filter}) async {
    setState(() {
      schemeLoader = true;
      schemesDetails.clear();
    });
    schemesDetails.addAll(await getSchemes(filter: filter));
    setState(() {
      schemeLoader = false;
    });
  }

  Future callApi() async {
    // await checkregister();
    await getcampdetail();
    schemesDetails.addAll(await getSchemes());
    // print(campdetail);
    // print(schemesDetails);
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
    if (!registration) {
      showDialog(
          context: context,
          builder: (context) => const RegistrationAlertPopup());
    }
  }

  @override
  void initState() {
    callApi();
    // log(registration.toString());

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
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => const ImageSourcePopup());
              },
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
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => Profile(
                          user: userDetail!,
                        )),
              ),
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  InkWell(
                    onTap: () {
                      if (filterclicked) {
                        setState(() {
                          filterclicked = false;
                        });
                      } else {
                        setState(() {
                          filterclicked = true;
                        });
                      }
                    },
                    child: SvgPicture.asset(
                      "assets/filter.svg",
                      color: black,
                      height: 30,
                      width: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              filterclicked
                  ? SizedBox(
                      height: 70,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          FilterContainer(
                            selectfilter: () => getFilter(
                                filter: "Health & for purchase of aids"),
                            title: 'Health',
                            path: "assets/medical.svg",
                          ),
                          FilterContainer(
                            selectfilter: () => getFilter(filter: "Pension"),
                            title: 'Pension',
                            path: "assets/retirement.svg",
                          ),
                          FilterContainer(
                            selectfilter: () => getFilter(filter: "Business"),
                            title: 'Business',
                            path: "assets/Growth.svg",
                          ),
                          FilterContainer(
                            selectfilter: () =>
                                getFilter(filter: "Career/ Education"),
                            title: 'Education',
                            path: "assets/mortarboard.svg",
                          ),
                          FilterContainer(
                            selectfilter: () => getFilter(filter: "Transport"),
                            title: 'Transport',
                            path: "assets/car.svg",
                          ),
                          FilterContainer(
                            selectfilter: () => getFilter(filter: "Marriage"),
                            title: 'Marriage',
                            path: "assets/wedding.svg",
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(height: 20),
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
                        return SchemeCard(
                          schemedata: schemdata,
                          register: register,
                        );
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
                        if (nowlistlength > schemesDetails.length) {
                          setState(() {
                            listlength = schemesDetails.length;
                          });
                        } else {
                          listlength = nowlistlength;
                        }
                      } else {
                        setState(() {
                          listlength = schemesDetails.length;
                          nomore = true;
                        });
                      }
                    });
                  },
                  child: Text(
                    nomore ? "Less..." : "More...",
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
