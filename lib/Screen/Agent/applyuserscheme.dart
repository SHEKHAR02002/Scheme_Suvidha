import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/api/getrecommendschemes.dart';
import 'package:scheme/model/schememodel.dart';
import 'package:scheme/widget/schemecard.dart';

class ApplyUserScheme extends StatefulWidget {
  const ApplyUserScheme({super.key});

  @override
  State<ApplyUserScheme> createState() => _ApplyUserSchemeState();
}

class _ApplyUserSchemeState extends State<ApplyUserScheme> {
  bool recommedLoader = true;
  List recommend = [];

  Future callApi() async {
    recommend.addAll(await getrecommendApi());
    if (recommend.isNotEmpty) {
      setState(() {
        recommedLoader = false;
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
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: bgcolor,
          centerTitle: true,
          title: Text(
            "APPLY SCHEME",
            style: TextStyle(
                color: black,
                fontFamily: "Zilla",
                fontSize: 20,
                fontWeight: FontWeight.w700),
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width / 1.1,
              decoration: shadowdecoration,
              child: TextField(
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      "assets/search.svg",
                      color: primary,
                      height: 10,
                      width: 10,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Recommend For You",
              style: TextStyle(
                  color: black,
                  fontFamily: "Zilla",
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            recommedLoader
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: recommend.length,
                    itemBuilder: (context, index) {
                      SchemeModel schemdata =
                          SchemeModel.fromMap(recommend[index]);
                      return SchemeCard(
                        schemedata: schemdata,
                        register: true,
                        agent: true,
                      );
                    }),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
