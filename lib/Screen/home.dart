import 'package:alan_voice/alan_voice.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scheme/Screen/agentwidget/filtercontainer.dart';
import 'package:scheme/Screen/knowagent.dart';
import 'package:scheme/Screen/notificationcenter.dart';
import 'package:scheme/Screen/profile.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/api/getrecommendschemes.dart';
import 'package:scheme/api/getscheme.dart';
import 'package:scheme/command/screenstate.dart';
import 'package:scheme/command/voicecommands.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/model/schememodel.dart';
import 'package:scheme/widget/alertcard.dart';
import 'package:scheme/widget/ngocards.dart';
import 'package:scheme/widget/campcardgrid.dart';
import 'package:scheme/widget/schemecard.dart';
import 'package:scheme/Screen/search.dart';
import 'package:scheme/widget/skeleton/campsskeleton.dart';
import 'package:scheme/widget/skeleton/ngocardskeleton.dart';
import 'package:scheme/widget/skeleton/schemecardskeleton.dart';
import 'package:scheme/widget/skeleton/schemestatuscard.dart';
import 'package:scheme/widget/statusapplyschemecard.dart';
import 'package:scheme/widget/statuscard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

ValueNotifier<List> schemeDataList = ValueNotifier<List>([]);

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // UserModel? user;
  bool filterclicked = false, recommedLoader = true;

  bool register = registration;
  bool verification = verificationstatus;
  int listlength = 3, selctedFilter = 0;
  int nowlistlength = 0;
  List recommend = [];
  bool nomore = false;

  bool clicked = false;
  //camps
  List campdetail = [];
  bool campLoader = true;
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

  //NGO
  List ngodetail = [];
  bool ngoLoader = true;
  Future getngodetail() async {
    await FirebaseFirestore.instance
        .collection('Ngos')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        ngodetail.add(doc.data());
      }
    });
    // print(campdetail);
  }

  //applied Scheme

  List appliedscheme = [];
  bool appliedschemeloader = true;
  Future getappliedscheme() async {
    await FirebaseFirestore.instance
        .collection(
            'Users/${FirebaseAuth.instance.currentUser!.uid}/AppliedScheme')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        appliedscheme.add(doc.data());
      }
    });
    // print(campdetail);
  }

  getAlan() {
    /// Init Alan Button with project key from Alan Studio
    AlanVoice.addButton(
        "2138334cc4efdbd5298ac6d09db1a2f22e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_RIGHT);

    getfunc(value, getValue) => setState(() {
          value = getValue;
        });

    /// Handle commands from Alan Studio
    AlanVoice.onCommand
        .add((command) => handleCommand(command.data, context, getfunc));
  }

  // Filter Scheme
  List schemesDetails = [];
  bool schemeLoader = true;
  Future getFilter({
    required String filter,
    required int setFilterIndex,
  }) async {
    setState(() {
      schemeLoader = true;
      listlength = 3;
      nomore = false;
      selctedFilter = setFilterIndex;
      schemesDetails.clear();
    });
    schemesDetails.addAll(await getSchemes(filter: filter));
    setState(() {
      schemeLoader = false;
    });
  }

  Future callApi() async {
    // getUserDetails();
    setVisuals("Home");
    screenSate = "Home";
    if (userDetail == null) {
      FirebaseAuth.instance.signOut();
    }
    setState(() {
      campLoader = true;
      ngoLoader = true;
      recommedLoader = true;
      schemeLoader = true;
      appliedschemeloader = false;
    });
    recommend.clear();
    campdetail.clear();
    ngodetail.clear();
    schemesDetails.clear();
    appliedscheme.clear();
    await getcampdetail();
    await getngodetail();
    await getappliedscheme();
    recommend.addAll(await getrecommendApi());
    schemesDetails.addAll(await getSchemes());
    // print(campdetail);
    // print(schemesDetails);
    if (mounted) {
      if (campdetail.isNotEmpty) {
        setState(() {
          campLoader = false;
        });
      }
      if (ngodetail.isNotEmpty) {
        setState(() {
          ngoLoader = false;
        });
      }
      if (schemesDetails.isNotEmpty) {
        setState(() {
          schemeLoader = false;
        });
      }
      if (recommend.isNotEmpty) {
        setState(() {
          recommedLoader = false;
        });
      }
    }

    // Future getUserDetails() async {
    //   bool status = false;
    //   await FirebaseFirestore.instance
    //       .collection("Users")
    //       .doc(FirebaseAuth.instance.currentUser!.uid.toString())
    //       .collection("AppliedScheme")
    //       .doc(userDetail!.applicationid)
    //       .get()
    //       .then((docSnapshot) async {
    //     var data = docSnapshot.data();
    //     userDetail = UserModel.fromMap(data!);

    //     status = data["verification"];
    //   });
    //   setState(() {
    //     verification = status;
    //   });
    // }
  }

  @override
  void initState() {
    getAlan();

    // Future.delayed(const Duration(seconds: 3), () => callApi());
    callApi();
    // log(registration.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double? logosize =
        ResponsiveValue(context, defaultValue: 40.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 28.0),
      Condition.largerThan(name: TABLET, value: 60.0)
    ]).value as double;
    double? iconsize =
        ResponsiveValue(context, defaultValue: 30.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 20.0),
      Condition.largerThan(name: TABLET, value: 50.0)
    ]).value as double;

    // if (!registration) {
    //   showDialog(
    //       context: context,
    //       builder: (context) => const RegistrationAlertPopup());
    // }
    return RefreshIndicator(
      onRefresh: () => callApi(),
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Image.asset(
              "assets/logo.png",
              height: logosize,
              width: logosize,
              fit: BoxFit.cover,
            ),
            backgroundColor: bgcolor,
            actions: [
              InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Search())),
                child: SvgPicture.asset(
                  "assets/search.svg",
                  color: primary,
                  height: iconsize,
                  width: iconsize,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  //showDialog(
                  //  context: context,
                  //builder: (context) => const ImageSourcePopup());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationCenter()));
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const UploadDocument()));
                },
                child: SvgPicture.asset(
                  "assets/notification.svg",
                  height: iconsize,
                  width: iconsize,
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
                    child: userDetail!.image != ""
                        ? ClipRRect(
                            child: Image.network(defaultPic,
                                width: iconsize, height: iconsize),
                          )
                        : CircleAvatar(
                            radius: iconsize / 2,
                            foregroundImage: NetworkImage(
                              userDetail!.image.toString(),
                            ))),
              )
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appliedscheme.isEmpty
                      ? StatusCard(
                          register: register,
                          verify: verification,
                        )
                      : appliedschemeloader
                          ? const SchemeStatusCard()
                          : Container(
                              decoration: shadowdecoration,
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  viewportFraction: 1,
                                  initialPage: 0,
                                  autoPlay: false,
                                  // height: ,
                                  aspectRatio: 1 / 0.5,
                                  autoPlayInterval: const Duration(seconds: 8),
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  scrollDirection: Axis.horizontal,
                                ),
                                items: appliedscheme
                                    .map((data) => ApplySchemeStatus(
                                          schemename: data['schemename'],
                                          id: data['schemeId'],
                                          progress: data['progress'],
                                        ))
                                    .toList(),
                              ),
                            ),
                  const SizedBox(height: 24),
                  register == false
                      ? const AlertCard()
                      : const SizedBox.shrink(),
                  const SizedBox(
                    height: 20,
                  ),
                  register
                      ? Text(
                          AppLocalizations.of(context)!.recommendforyou,
                          style: TextStyle(
                              color: black,
                              fontFamily: "Zilla",
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        )
                      : const SizedBox.shrink(),
                  register
                      ? recommedLoader
                          ? const SkeltonSchemeCard()
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: recommend.length,
                              itemBuilder: (context, index) {
                                SchemeModel schemdata =
                                    SchemeModel.fromMap(recommend[index]);
                                return SchemeCard(
                                  verification: verification,
                                  schemedata: schemdata,
                                  register: register,
                                  agent: false,
                                );
                              })
                      : const SizedBox.shrink(),
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.schemesforall,
                        style: TextStyle(
                            color: black,
                            fontFamily: "Zilla",
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                      selctedFilter != 0
                          ? InkWell(
                              onTap: () async {
                                setState(() {
                                  selctedFilter = 0;
                                  schemeLoader = true;
                                });
                                schemesDetails.addAll(await getSchemes());
                                if (schemesDetails.isNotEmpty) {
                                  setState(() {
                                    schemeLoader = false;
                                  });
                                }
                              },
                              child: Icon(
                                Icons.clear_all_outlined,
                                color: primary,
                              ))
                          : const SizedBox.shrink()
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 70,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        FilterContainer(
                          selectfilter: () => getFilter(
                              filter: "Health & for purchase of aids",
                              setFilterIndex: 1),
                          title: AppLocalizations.of(context)!.health,
                          path: "assets/medical.svg",
                          seletedFilterindex: selctedFilter,
                          myindex: 1,
                        ),
                        FilterContainer(
                            selectfilter: () =>
                                getFilter(filter: "Pension", setFilterIndex: 2),
                            title: AppLocalizations.of(context)!.pension,
                            path: "assets/retirement.svg",
                            seletedFilterindex: selctedFilter,
                            myindex: 2),
                        FilterContainer(
                            selectfilter: () => getFilter(
                                filter: "Business", setFilterIndex: 3),
                            title: AppLocalizations.of(context)!.business,
                            path: "assets/Growth.svg",
                            seletedFilterindex: selctedFilter,
                            myindex: 3),
                        FilterContainer(
                            selectfilter: () => getFilter(
                                filter: "Career/ Education", setFilterIndex: 4),
                            title: AppLocalizations.of(context)!.education,
                            path: "assets/mortarboard.svg",
                            seletedFilterindex: selctedFilter,
                            myindex: 4),
                        FilterContainer(
                            selectfilter: () => getFilter(
                                filter: "Transport", setFilterIndex: 5),
                            title: AppLocalizations.of(context)!.transport,
                            path: "assets/car.svg",
                            seletedFilterindex: selctedFilter,
                            myindex: 5),
                        FilterContainer(
                            selectfilter: () => getFilter(
                                filter: "Marriage", setFilterIndex: 6),
                            title: AppLocalizations.of(context)!.marriage,
                            path: "assets/wedding.svg",
                            seletedFilterindex: selctedFilter,
                            myindex: 6),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  schemeLoader
                      ? const SkeltonSchemeCard()
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: schemesDetails.length < listlength
                              ? schemesDetails.length
                              : listlength,
                          itemBuilder: (context, index) {
                            SchemeModel schemdata =
                                SchemeModel.fromMap(schemesDetails[index]);
                            return SchemeCard(
                              verification: verification,
                              schemedata: schemdata,
                              register: register,
                              agent: false,
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
                        nomore
                            ? AppLocalizations.of(context)!.less
                            : AppLocalizations.of(context)!.more,
                        style: TextStyle(
                            color: primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.nearbyngo,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Zilla"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ngoLoader
                      ? const NGOCardSkeleton()
                      : Container(
                          decoration: shadowdecoration,
                          child: CarouselSlider(
                            options: CarouselOptions(
                              viewportFraction: 1,
                              initialPage: 0,
                              autoPlay: false,
                              // height: ,
                              aspectRatio: 1 / 1.1,
                              autoPlayInterval: const Duration(seconds: 8),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                            ),
                            items: ngodetail
                                .map((data) => NGOCard(
                                      image: data['ngoLogo'],
                                      name: data['ngoName'],
                                      ngoid: data['ngoId'],
                                      address: data['ngoAddress'],
                                      phone: data['ngoContact'],
                                    ))
                                .toList(),
                          ),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    AppLocalizations.of(context)!.campaigns,
                    style: TextStyle(
                        color: black,
                        fontFamily: "Zilla",
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  campLoader
                      ? const CampsSkeleton()
                      : CampView(
                          ngoDataList: campdetail,
                          width: width,
                        ),
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                            color: advertisement,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: primary)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .needhelpinregister,
                                style: TextStyle(
                                    color: primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Zilla"),
                              ),
                              Text(
                                AppLocalizations.of(context)!
                                    .wegotverifiedagent,
                                style: TextStyle(
                                    color: primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Zilla"),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      side: BorderSide(
                                          width: 1.0, color: primary)),
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const KnowAgent())),
                                  child: Text(
                                    AppLocalizations.of(context)!.knowmore,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          top: 5,
                          child: SvgPicture.asset("assets/avd.svg"))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )),
    );
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
