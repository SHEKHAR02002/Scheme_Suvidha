import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/api/getscheme.dart';
import 'package:scheme/model/appliedschememodel.dart';
import 'package:scheme/widget/applyschemecard.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';

class AppliedScheme extends StatefulWidget {
  const AppliedScheme({super.key});

  @override
  State<AppliedScheme> createState() => _AppliedSchemeState();
}

class _AppliedSchemeState extends State<AppliedScheme> {
  List appliedschemelist = [];
  bool loader = true;
  Future callApi() async {
    appliedschemelist.addAll(await getappliedscheme());
    if (appliedschemelist.isNotEmpty && mounted) {
      setState(() {
        loader = false;
      });
    }
    print(appliedschemelist.length);
  }

  @override
  void initState() {
    callApi();
    // log(registration.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: black,
          ),
        ),
        title: Text(
          "Applied Scheme",
          style: TextStyle(
              color: black,
              fontFamily: "Zilla",
              fontSize: 24,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: appliedschemelist.isEmpty
          ? Center(
              child: Lottie.asset("animations/empty.json",
                  height: 500, width: 500),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: loader
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: appliedschemelist.length,
                      itemBuilder: (context, index) {
                        ApplySchmeDetail schemdata =
                            ApplySchmeDetail.fromMap(appliedschemelist[index]);
                        return CardAppliedScheme(
                          applyschemes: schemdata,
                        );
                      })),
    );
  }
}
