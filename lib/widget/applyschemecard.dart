import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/model/appliedschememodel.dart';

class CardAppliedScheme extends StatelessWidget {
  final ApplySchmeDetail applyschemes;
  const CardAppliedScheme({super.key, required this.applyschemes});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => const ApplySchemeDetail(),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: SvgPicture.asset(
                "assets/scheme.svg",
                height: 30,
                width: 30,
              ),
              title: Text(applyschemes.schmename.toString()),
              subtitle:
                  Text(applyschemes.verification == true ? "Done" : "Not Done"),
            ),
          ],
        ),
      ),
    );
  }
}

class ApplySchemeDetail extends StatefulWidget {
  const ApplySchemeDetail({super.key});

  @override
  State<ApplySchemeDetail> createState() => _ApplySchemeDetailState();
}

class _ApplySchemeDetailState extends State<ApplySchemeDetail> {
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
          "Applied Scheme Details",
          style: TextStyle(
              color: black,
              fontFamily: "Zilla",
              fontSize: 24,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: Column(children: const [Text("scheme")]),
    );
  }
}
