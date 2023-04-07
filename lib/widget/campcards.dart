import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:scheme/Screen/campdetail.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/data/userdata.dart';

class CampCard extends StatelessWidget {
  // final String image;
  final String id;
  final String address;
  final String phoneno;
  final String name;

  const CampCard(
      {super.key,
      // required this.image,
      required this.id,
      required this.address,
      required this.phoneno,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CampsDetails(
                      id: id,
                    ))),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                          key: UniqueKey(),
                          cacheManager: customCacheManager,
                          height: 80,
                          width: 74,
                          fit: BoxFit.fill,
                          imageUrl: organizationpic,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator())),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: primary),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  address,
                  style: const TextStyle(wordSpacing: 2),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(phoneno),
                const SizedBox(
                  height: 10,
                ),
                const Text("Timing : opens 9 am"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
