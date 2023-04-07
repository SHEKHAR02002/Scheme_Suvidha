import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/api/getcampngodata.dart';
import 'package:scheme/model/ngomodel.dart';

class NGODetail extends StatefulWidget {
  final String id;
  const NGODetail({super.key, required this.id});

  @override
  State<NGODetail> createState() => _NGODetailState();
}

class _NGODetailState extends State<NGODetail> {
  List otherDonation = [];
  bool loader = true;
  NgoModel? ngodetail;

  getData({required String id}) async {
    await FirebaseFirestore.instance
        .collection('Ngos')
        .doc(id)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      otherDonation.addAll(await getNGOs());
      List temp = [];
      temp.add(documentSnapshot.data());
      for (var tempData in temp) {
        ngodetail = NgoModel.fromMap(tempData);
      }
    }).whenComplete(() => setState(() => loader = false));
    print(ngodetail!.ngoname);
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
          "Ngo Details",
          style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w400,
              fontFamily: "Zilla"),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: loader
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      ngodetail!.ngologo.toString(),
                      height: 185,
                      width: width,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    ngodetail!.ngoname.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: primary),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Description",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: primary),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text(
                            subtitle: ngodetail!.ngodetail.toString(),
                            title: 'Short Description : '),
                        const SizedBox(
                          height: 10,
                        ),
                        text(
                            subtitle: ngodetail!.ngoaddress.toString(),
                            title: 'Address: '),
                        const SizedBox(
                          height: 10,
                        ),
                        text(
                            subtitle: ngodetail!.ngocontact.toString(),
                            title: 'Conatct : '),
                        const SizedBox(
                          height: 10,
                        ),
                        text(
                            subtitle: ngodetail!.ngoemail.toString(),
                            title: 'Email : '),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Social Media",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: primary),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text(
                            subtitle: ngodetail!.ngowebsite.toString(),
                            title: 'Website Link : '),
                        const SizedBox(
                          height: 10,
                        ),
                        text(
                            subtitle: ngodetail!.ngofacebook.toString(),
                            title: 'Facebook Link : '),
                        const SizedBox(
                          height: 10,
                        ),
                        text(
                            subtitle: ngodetail!.ngoinsta.toString(),
                            title: 'Instagram Link : '),
                        const SizedBox(
                          height: 10,
                        ),
                        text(
                            subtitle: ngodetail!.ngotwitter.toString(),
                            title: 'Twitter Link : '),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Founders",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: primary),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text(
                            subtitle: ngodetail!.ngofoundname.toString(),
                            title: 'Founder Name : '),
                        const SizedBox(
                          height: 10,
                        ),
                        text(
                            subtitle: ngodetail!.ngofoundcontact.toString(),
                            title: 'Founder Contact : '),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

Widget text({required String title, required String subtitle}) {
  return RichText(
    text: TextSpan(
      text: title,
      style: TextStyle(
        color: black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      children: <TextSpan>[
        TextSpan(
            text: subtitle,
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 16, color: text2)),
      ],
    ),
  );
}
