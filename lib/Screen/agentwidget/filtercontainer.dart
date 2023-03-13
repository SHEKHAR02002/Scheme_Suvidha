import 'package:flutter/material.dart';

class FilterContainer extends StatefulWidget {
  final String title;
  final Function selectfilter;
  const FilterContainer(
      {super.key, required this.title, required this.selectfilter});

  @override
  State<FilterContainer> createState() => _FilterContainerState();
}

class _FilterContainerState extends State<FilterContainer> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(
            0xffe7e7e7,
          ),
        ),
        child: Text(
          widget.title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
