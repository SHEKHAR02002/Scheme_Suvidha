import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/model/campmodel.dart';

class CampsDetails extends StatefulWidget {
  final CampsModel campdetail;
  const CampsDetails({super.key, required this.campdetail});

  @override
  State<CampsDetails> createState() => _CampsDetailsState();
}

class _CampsDetailsState extends State<CampsDetails> {
  int current = 0;
  List data = [];
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
          "NGO Campaign",
          style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w400,
              fontFamily: "Zilla"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.campdetail.image.toString(),
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
                    fontSize: 20, fontWeight: FontWeight.w800, color: primary),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                "Description :${widget.campdetail.campdescription}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              Text(
                "Category :${widget.campdetail.campcategory}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              Text(
                "Camp benefit :${widget.campdetail.campbenefit}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              Text(
                "Organization :${widget.campdetail.camporganization}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              Text(
                "Place :${widget.campdetail.campplace}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              Text(
                "Time :${widget.campdetail.camptime}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              Text(
                "Date:${widget.campdetail.date}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
