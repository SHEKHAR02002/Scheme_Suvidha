import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/widget/campdetail.dart';
import '../provider/firebasehelper.dart';

class CampCard extends StatefulWidget {
  final String image, title, date, id, place;

  const CampCard(
      {super.key,
      required this.image,
      required this.title,
      required this.date,
      required this.id,
      required this.place});

  @override
  State<CampCard> createState() => _CampCardState();
}

class _CampCardState extends State<CampCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async {
        await FirebaseHelper()
            .getCampDetailModel(id: widget.id)
            .then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CampsDetails(
                            campdetail: value!,
                          )),
                ));
      },
      child: Card(
        // height: 400,
        // width: width,
        // decoration: shadowdecoration,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.image,
                  height: 185,
                  width: width - 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(widget.title,
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
                  Icons.date_range,
                  size: 20,
                  color: primary,
                ),
                Text(
                  widget.date,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  CupertinoIcons.location_solid,
                  size: 20,
                  color: primary,
                ),
                Text(
                  widget.place,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
