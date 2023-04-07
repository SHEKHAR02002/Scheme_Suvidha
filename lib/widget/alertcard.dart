import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Screen/registrationscreens/upload.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AlertCard extends StatefulWidget {
  const AlertCard({super.key});

  @override
  State<AlertCard> createState() => _AlertCardState();
}

class _AlertCardState extends State<AlertCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double? fontsize14 =
        ResponsiveValue(context, defaultValue: 14.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 10.0),
      Condition.largerThan(name: TABLET, value: 26.0)
    ]).value as double;
    double? fontsize16 =
        ResponsiveValue(context, defaultValue: 16.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 12.0),
      Condition.largerThan(name: TABLET, value: 30.0)
    ]).value as double;
    double? size20 =
        ResponsiveValue(context, defaultValue: 20.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 16.0),
      Condition.largerThan(name: TABLET, value: 32.0)
    ]).value as double;
    double? iconsize =
        ResponsiveValue(context, defaultValue: 30.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 20.0),
      Condition.largerThan(name: TABLET, value: 50.0)
    ]).value as double;
    double? gap = ResponsiveValue(context, defaultValue: 8.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 6.0),
      Condition.largerThan(name: TABLET, value: 10.0)
    ]).value as double;
    return Stack(children: [
      Container(
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: primary, width: 2)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/error.svg",
                  height: iconsize,
                  width: iconsize,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(AppLocalizations.of(context)!.registeryourself,
                    style: TextStyle(
                        fontSize: fontsize16, fontWeight: FontWeight.w600)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(AppLocalizations.of(context)!.takeadvantagescheme,
                  style: TextStyle(
                      fontSize: fontsize14, fontWeight: FontWeight.w400)),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    elevation: 0,
                    padding:
                        EdgeInsets.symmetric(horizontal: size20, vertical: gap),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UploadDoument())),
                child: Text(
                  AppLocalizations.of(context)!.register,
                  style: TextStyle(
                      fontSize: fontsize14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ))
          ]),
        ),
      ),
    ]);
  }
}
