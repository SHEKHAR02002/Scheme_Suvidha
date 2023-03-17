import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';

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
    return Container(
      // height: 150,
      width: width,
      decoration: shadowdecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Text(
            "Your Status",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Zilla",
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              PieChart(
                dataMap: statusdata,
                animationDuration: const Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                colorList: [secondary, primary],
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 15,
                centerText: register ? "50%" : "0%",
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
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      register
                          ? "Registration : Done"
                          : "Registration : Not Done",
                      style: TextStyle(
                          color: text2,
                          fontFamily: "Zilla",
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      verify ? "Verification : Done" : "Verification : Pending",
                      style: TextStyle(
                          color: text2,
                          fontFamily: "Zilla",
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
