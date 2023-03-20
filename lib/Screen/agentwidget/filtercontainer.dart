import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheme/Theme/color.dart';

class FilterContainer extends StatefulWidget {
  final String title, path;
  final Function selectfilter;
  const FilterContainer(
      {super.key,
      required this.title,
      required this.selectfilter,
      required this.path});

  @override
  State<FilterContainer> createState() => _FilterContainerState();
}

class _FilterContainerState extends State<FilterContainer> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.selectfilter();
      },
      child: Container(
        // width: 20,
        // height: 60,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: clicked ? primary : Colors.white,
          border: Border.all(color: secondary),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              widget.path,
              color: clicked ? Colors.white : primary,
              height: 30,
              width: 30,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: clicked ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
