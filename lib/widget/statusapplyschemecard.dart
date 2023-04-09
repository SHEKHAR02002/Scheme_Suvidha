import 'package:flutter/cupertino.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/provider/googletranslator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ApplySchemeStatus extends StatefulWidget {
  final String schemename, id;
  final int progress;
  const ApplySchemeStatus(
      {super.key,
      required this.schemename,
      required this.id,
      required this.progress});

  @override
  State<ApplySchemeStatus> createState() => _ApplySchemeStatusState();
}

class _ApplySchemeStatusState extends State<ApplySchemeStatus> {
  String schemename = "";
  callApi() async {
    String tempschemename = await TranslationService()
        .translate(text: widget.schemename, targetLanguage: "hi");
    if (mounted) {
      setState(() {
        schemename = tempschemename;
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
              Text(
                AppLocalizations.of(context)!.schemestatus,
                style: const TextStyle(
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
                  turnOnGOOGleAPI
                      ? AppLocalizations.of(context)!.schemename(schemename)
                      : AppLocalizations.of(context)!
                          .schemename(widget.schemename),
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
                    AppLocalizations.of(context)!.underprocess,
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
                    AppLocalizations.of(context)!.applied,
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
            colorList: widget.progress == 0
                ? [secondary, secondary]
                : widget.progress == 1
                    ? [primary, secondary]
                    : widget.progress == 2
                        ? [primary, primary]
                        : [red, red],
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 15,
            centerText: widget.progress == 0
                ? "0%"
                : widget.progress == 1
                    ? "50%"
                    : widget.progress == 2
                        ? '100%'
                        : "Rejected",
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
