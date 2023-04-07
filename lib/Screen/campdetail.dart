import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/api/getcampngodata.dart';
import 'package:scheme/model/campmodel.dart';

class CampsDetails extends StatefulWidget {
  final String id;
  const CampsDetails({super.key, required this.id});

  @override
  State<CampsDetails> createState() => _CampsDetailsState();
}

class _CampsDetailsState extends State<CampsDetails> {
  List otherDonation = [];
  bool loader = true;
  CampsModel? campdetail;

  getData({required String id}) async {
    await FirebaseFirestore.instance
        .collection('Camps')
        .doc(id)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      otherDonation.addAll(await getCamps());
      List temp = [];
      temp.add(documentSnapshot.data());
      for (var tempData in temp) {
        campdetail = CampsModel.fromMap(tempData);
      }
    }).whenComplete(() => setState(() => loader = false));
  }

  @override
  void initState() {
    getData(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        title: const Text(
          "Camps Details",
          style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w400,
              fontFamily: "Zilla"),
        ),
      ),
      body: SingleChildScrollView(
        child: loader
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        campdetail!.image.toString(),
                        height: 185,
                        width: width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Know your rights - an initiative towards your better future ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: primary),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      "Description :${campdetail!.campdescription}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Category :${campdetail!.campcategory}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Camp benefit :${campdetail!.campbenefit}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Organization :${campdetail!.camporganization}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Place :${campdetail!.campplace}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Time :${campdetail!.camptime}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Date:${campdetail!.date}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class TextContent extends StatefulWidget {
  final String heading, content;
  const TextContent({super.key, required this.heading, required this.content});

  @override
  State<TextContent> createState() => _TextContentState();
}

class _TextContentState extends State<TextContent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.heading,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        Text(
          widget.content,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
