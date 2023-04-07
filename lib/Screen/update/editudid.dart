import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/api/checknewuser.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/model/usermodel.dart';
import 'package:scheme/widget/textfield.dart';

class Editudid extends StatefulWidget {
  final UserModel user;
  const Editudid({super.key, required this.user});

  @override
  State<Editudid> createState() => _EditudidState();
}

class _EditudidState extends State<Editudid> {
  final TextEditingController _editudid = TextEditingController();
  // final TextEditingController _editname = TextEditingController();
  final TextEditingController _editdisability = TextEditingController();
  final TextEditingController _editdisabilitypercentage =
      TextEditingController();
  final TextEditingController _editdateissue = TextEditingController();
  final TextEditingController _editvaildupto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: black,
          ),
        ),
        title: Text(
          "Edit UDID Details",
          style: TextStyle(
              color: black,
              fontFamily: "Zilla",
              fontSize: 24,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Edittext(
              title: "Edit UDID No.",
              subtitle: widget.user.udidno.toString(),
              controller: _editudid,
            ),
            const SizedBox(height: 20),
            Edittext(
              title: "Disability Type",
              subtitle: widget.user.disabilitytype.toString(),
              controller: _editdisability,
            ),
            const SizedBox(height: 20),
            Edittext(
              title: "Disability Percentage",
              subtitle: widget.user.disabilitypercentage.toString(),
              controller: _editdisabilitypercentage,
            ),
            const SizedBox(height: 20),
            Edittext(
              title: "Date Of Issue",
              subtitle: widget.user.dateissue.toString(),
              controller: _editdateissue,
            ),
            const SizedBox(height: 20),
            Edittext(
              title: "Valid Upto",
              subtitle: widget.user.validupto.toString(),
              controller: _editvaildupto,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  udidNo = _editudid.text == ""
                      ? widget.user.udidno
                      : _editudid.text;
                  disbilitytype = _editdisability.text == ""
                      ? widget.user.disabilitytype
                      : _editdisability.text;
                  disabilitypercentage = _editdisabilitypercentage.text == ""
                      ? widget.user.disabilitypercentage
                      : _editdisabilitypercentage.text;
                  dataissue = _editdateissue.text == ""
                      ? widget.user.dateissue
                      : _editdateissue.text;
                  validupto = _editvaildupto.text == ""
                      ? widget.user.validupto
                      : _editvaildupto.text;
                });
                updateudid();
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  backgroundColor: primary,
                  minimumSize: Size(width, 50)),
              child: const Text(
                "Update",
                style: TextStyle(
                    fontFamily: "Overpass",
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ))),
    );
  }
}
