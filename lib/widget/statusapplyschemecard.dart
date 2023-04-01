import 'package:flutter/cupertino.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:scheme/Theme/color.dart';

class ApplySchemeStatus extends StatelessWidget {
  final String schemename, id;
  final int progress;
  const ApplySchemeStatus(
      {super.key,
      required this.schemename,
      required this.id,
      required this.progress});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Map<String, double> statusdata = {
      "Under Process": 5,
      "Applied": 5,
    };
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Scheme Status",
                style: TextStyle(
                    fontFamily: "Zilla",
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: width / 2,
                child: Text(
                  "Scheme Name : $schemename",
                  style: TextStyle(
                      color: text2,
                      fontFamily: "Zilla",
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.circle_fill,
                    size: 9,
                    color: secondary,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Under process",
                    style: TextStyle(
                        color: text2,
                        fontFamily: "Zilla",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.circle_fill,
                    size: 9,
                    color: primary,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Applied",
                    style: TextStyle(
                        color: text2,
                        fontFamily: "Zilla",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )
                ],
              )
            ],
          ),
          PieChart(
            dataMap: statusdata,
            animationDuration: const Duration(milliseconds: 800),
            chartLegendSpacing: 32,
            chartRadius: MediaQuery.of(context).size.width / 4,
            colorList: progress == 0
                ? [secondary, secondary]
                : progress == 1
                    ? [primary, secondary]
                    : [primary, primary],
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 15,
            centerText: progress == 0
                ? "0%"
                : progress == 1
                    ? "50%"
                    : "100%",
            centerTextStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: primary,
            ),
            legendOptions: const LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.right,
              showLegends: false,
              // legendShape: _BoxShape.circle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: const ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: false,
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
              decimalPlaces: 1,
            ),
            // gradientList: ---To add gradient colors---
            // emptyColorGradient: ---Empty Color gradient---
          ),
        ],
      ),
    );
  }
}
