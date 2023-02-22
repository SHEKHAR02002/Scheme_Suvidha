import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
class TextFieldTake extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  const TextFieldTake({super.key,required this.controller,required this.title});

  @override
  State<TextFieldTake> createState() => _TextFieldTakeState();
}

class _TextFieldTakeState extends State<TextFieldTake> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            widget.title,
            style: TextStyle(
                color: black,
                fontFamily: "Overpass",
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
        const SizedBox(height: 10,),     
        Container(
                height: 45,
                decoration: shadowdecoration,
                child: TextField(
                  // keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  controller: widget.controller,
                ),
              ),
      ],
    );
  }
}