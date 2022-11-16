import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:scheme/Screen/submit.dart';
import 'package:scheme/Theme/color.dart';

class Apply_Scheme extends StatefulWidget {
  const Apply_Scheme({super.key});

  @override
  State<Apply_Scheme> createState() => _Apply_SchemeState();
}

class _Apply_SchemeState extends State<Apply_Scheme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Disability Type",
                style: TextStyle(
                  color: text1,
                  fontFamily: "Overpass",
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.52,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: textfiled,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Select Scheme",
                style: TextStyle(
                  color: text1,
                  fontFamily: "Overpass",
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.52,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: textfiled,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: button),
                      onPressed: () {},
                      child: Text(
                        "Apply",
                        style: TextStyle(
                            fontFamily: 'Overpass',
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Best Scheme",
                style: TextStyle(
                  color: text1,
                  fontFamily: "Overpass",
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.52,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Table(
                border: TableBorder.symmetric(
                    inside: BorderSide(width: 1, color: button),
                    outside: BorderSide(width: 2, color: button)),
                children: [
                  buildRow(['Type', 'Scheme Name', 'Take Action']),
                  buildRow(['Blindness', 'Travelling Allowance', 'Apply']),
                  buildRow(['Blindness', 'Nishashkt Vivah', 'Apply'])
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Other Scheme",
                style: TextStyle(
                  color: text1,
                  fontFamily: "Overpass",
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.52,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Table(
                border: TableBorder.symmetric(
                    inside: BorderSide(width: 1, color: button),
                    outside: BorderSide(width: 2, color: button)),
                children: [
                  buildRow(['Scheme Name', 'Take Action']),
                  buildRow([' ', 'Apply']),
                  buildRow([' ', 'Apply']),
                  buildRow([' ', 'Apply']),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: button),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Submit()));
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            fontFamily: 'Overpass',
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildRow(List<String> cells) => TableRow(
        children: cells
            .map((cell) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      cell,
                      style: TextStyle(
                          color: text1,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ))
            .toList(),
      );
}
