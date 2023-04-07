import 'package:flutter/material.dart';
import 'package:scheme/Screen/ngodetail.dart';
import 'package:scheme/Theme/color.dart';

class NGOCard extends StatefulWidget {
  final String ngoid, image, name, address, phone;
  const NGOCard(
      {super.key,
      required this.ngoid,
      required this.image,
      required this.name,
      required this.address,
      required this.phone});

  @override
  State<NGOCard> createState() => _NGOCardState();
}

class _NGOCardState extends State<NGOCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NGODetail(
                    id: widget.ngoid,
                  ))),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                widget.image,
                height: 185,
                width: width - 60,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(widget.name,
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: primary,
              )),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.call,
                color: primary,
                size: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                widget.phone,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.navigation,
                color: primary,
                size: 15,
              ),
              SizedBox(
                width: width - 100,
                child: Text(
                  widget.address,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
