import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';

class TextFieldTake extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType typeofKeyboard;
  const TextFieldTake(
      {super.key,
      required this.controller,
      required this.title,
      required this.typeofKeyboard});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: black,
              fontFamily: "Overpass",
              fontSize: 20,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 45,
          decoration: shadowdecoration,
          child: TextField(
            keyboardType: typeofKeyboard,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5)),
            ),
            controller: controller,
          ),
        ),
      ],
    );
  }
}

class Edittext extends StatefulWidget {
  final String title, subtitle;
  final TextEditingController controller;
  const Edittext(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.controller});

  @override
  State<Edittext> createState() => _EdittextState();
}

class _EdittextState extends State<Edittext> {
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
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 45,
          decoration: shadowdecoration,
          child: TextField(
            // keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              filled: true,
              hintText: widget.subtitle,
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
