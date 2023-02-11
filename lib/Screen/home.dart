import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scheme/Screen/profile.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/api/firebasehelper.dart';
import 'package:scheme/api/getscheme.dart';
import 'package:scheme/model/schememodel.dart';
import 'package:scheme/model/usermodel.dart';
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

  callApi() async {
    try {
      var data = await getdata();

      schemeDataList.value.addAll(data);
      setState(() {
        if (schemeDataList.value.isNotEmpty) {
          loader = false;
        } else {
          loader = true;
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  void initState() {
    if (FirebaseAuth.instance.currentUser!.uid.isNotEmpty &&
        schemeDataList.value.isEmpty) {
      callApi();
    }
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
            SvgPicture.asset(
              "assets/notification.svg",
              color: Colors.black,
              height: 30,
              width: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () => register
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profile(
                                user: user!,
                              )))
                  : Fluttertoast.showToast(
                      msg: "You Not Register",
                      toastLength: Toast.LENGTH_LONG,
                      fontSize: 20,
                      backgroundColor: secondary,
                      textColor: Colors.black),
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
                            '$user.image',
                            fit: BoxFit.cover,
                          ),
                        )),
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StatusCard(
                register: register,
                verify: verification,
              ),
              const SizedBox(
                height: 38,
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
              const SizedBox(
                height: 30,
              ),
              Center(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: schemeDataList.value.length,
                    itemBuilder: (context, index) {
                      if (schemeDataList.value.isNotEmpty || loader == false) {
                        SchemeModel schemedata =
                            SchemeModel.fromMap(schemeDataList.value[index]);

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SchemeCard(
                              key: Key(schemedata.schemeid.toString()),
                              schemedata: schemedata,
                              index: index),
                        );
                      } else {
                        return const Text("no data");
                      }
                    }),
              ),
            ],
          ),
        )),
        bottomNavigationBar: register == false
            ? Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                child: ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UploadDoument())),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: primary,
                        minimumSize: Size(width, 50)),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                          fontFamily: "Overpass",
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )))
            : const SizedBox.shrink());
  }
}

// ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       fixedSize: const Size(250, 50),
//                       elevation: 0,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12)),
//                       backgroundColor: button),
//                   onPressed: () => PhoneAuth().logOut(context: context),
//                   child: const Text(
//                     "Logout",
//                     style: TextStyle(
//                         fontFamily: 'Overpass',
//                         fontSize: 24,
//                         fontWeight: FontWeight.w700),
//                   )),
