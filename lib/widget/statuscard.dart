import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scheme/Theme/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StatusCard extends StatelessWidget {
  final bool register, verify;
  const StatusCard({super.key, required this.register, required this.verify});

  @override
  Widget build(BuildContext context) {
    Map<String, double> statusdata = {
      "Registration": 5,
      "Verification": 5,
    };
    double width = MediaQuery.of(context).size.width;
    double? fontsize16 =
        ResponsiveValue(context, defaultValue: 16.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 12.0),
      Condition.largerThan(name: TABLET, value: 30.0)
    ]).value as double;
    double? fontsize20 =
        ResponsiveValue(context, defaultValue: 20.0, valueWhen: const [
      Condition.smallerThan(name: MOBILE, value: 16.0),
      Condition.largerThan(name: TABLET, value: 34.0)
    ]).value as double;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: width,
      decoration: BoxDecoration(
          color: secondary,
          border: Border.all(color: primary),
          borderRadius: BorderRadius.circular(5)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
          AppLocalizations.of(context)!.yourstatus,
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Zilla",
              fontSize: fontsize20,
              fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: RichText(
            text: TextSpan(
              text: AppLocalizations.of(context)!.registration,
              style: TextStyle(
                  color: text2,
                  fontFamily: "Zilla",
                  fontSize: fontsize16,
                  fontWeight: FontWeight.w500),
              children: <TextSpan>[
                TextSpan(
                  text: register
                      ? AppLocalizations.of(context)!.done
                      : AppLocalizations.of(context)!.notdone,
                  style: TextStyle(
                      color: register ? Colors.green : Colors.red,
                      fontFamily: "Zilla",
                      fontSize: fontsize16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}


// pie chart

// PieChart(
              //   dataMap: statusdata,
              //   animationDuration: const Duration(milliseconds: 800),
              //   chartLegendSpacing: 32,
              //   chartRadius: MediaQuery.of(context).size.width / 3.2,
              //   colorList:
              //       register ? [secondary, primary] : [secondary, secondary],

              //   initialAngleInDegree: 0,
              //   chartType: ChartType.ring,
              //   ringStrokeWidth: 15,
              //   centerText: register ? "50%" : "0%",
              //   centerTextStyle: TextStyle(
              //     fontSize: 12,
              //     fontWeight: FontWeight.w400,
              //     color: primary,
              //   ),
              //   legendOptions: const LegendOptions(
              //     showLegendsInRow: false,
              //     legendPosition: LegendPosition.right,
              //     showLegends: false,
              //     // legendShape: _BoxShape.circle,
              //     legendTextStyle: TextStyle(
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              //   chartValuesOptions: const ChartValuesOptions(
              //     showChartValueBackground: true,
              //     showChartValues: false,
              //     showChartValuesInPercentage: false,
              //     showChartValuesOutside: false,
              //     decimalPlaces: 1,
              //   ),
              //   // gradientList: ---To add gradient colors---
              //   // emptyColorGradient: ---Empty Color gradient---
              // ),