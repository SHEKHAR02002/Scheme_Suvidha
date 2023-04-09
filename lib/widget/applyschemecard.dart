import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/model/appliedschememodel.dart';
import 'package:scheme/widget/stepper.dart';

class CardAppliedScheme extends StatelessWidget {
  final ApplySchmeDetail applyschemes;
  const CardAppliedScheme({super.key, required this.applyschemes});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ApplySchemeDetail(
                    applyschemes: applyschemes,
                  ))),
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
              title: Text(applyschemes.schemename.toString()),
              subtitle: Text(applyschemes.progress == 3 ? "Done" : "Not Done"),
            ),
          ],
        ),
      ),
    );
  }
}

class ApplySchemeDetail extends StatefulWidget {
  final ApplySchmeDetail applyschemes;
  const ApplySchemeDetail({super.key, required this.applyschemes});

  @override
  State<ApplySchemeDetail> createState() => _ApplySchemeDetailState();
}

class _ApplySchemeDetailState extends State<ApplySchemeDetail> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Scheme Applied",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/scheme.svg",
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "ADIP Scheme",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Pending.....",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: text2),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      const Text(
                        "Date of application",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "08/04/2022",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: text2),
                      )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      const Text(
                        "Scheme validity",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "08/04/2022",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: text2),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Status of Scheme",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.applyschemes.status.toString(),
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w400, color: text2),
              ),
              SizedBox(
                  height: 200,
                  width: width,
                  child: ProgressBar(
                    progress: widget.applyschemes.progress,
                  )),
              const SizedBox(
                height: 20,
              ),
            ])),
      ),
    );
  }
}
