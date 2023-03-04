import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';
class FAQ extends StatefulWidget {
  final String question,answer;
  const FAQ({super.key,required this.answer,required this.question});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        widget.question,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: isExpanded ? primary : Colors.black),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            widget.answer,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        )
      ],
      onExpansionChanged: (bool expanding) =>
          setState(() => isExpanded = expanding),
    );
  }
}