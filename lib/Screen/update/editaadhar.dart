
import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/api/checknewuser.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/model/usermodel.dart';
import 'package:scheme/widget/textfield.dart';

class EditAadhar extends StatefulWidget {
  final UserModel user;
  const EditAadhar({super.key, required this.user});

  @override
  State<EditAadhar> createState() => _EditAadharState();
}

class _EditAadharState extends State<EditAadhar> {
  final TextEditingController _aadharNoedit = TextEditingController();
  final TextEditingController _dobedit = TextEditingController();
  final TextEditingController _genderedit = TextEditingController();
  final TextEditingController _nameedit = TextEditingController();
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
          "Edit Aadhar Details",
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
                title: "Aadhar Card No.",
                subtitle: widget.user.aadharno.toString(),
                controller: _aadharNoedit,
              ),
              const SizedBox(height: 20),
              Edittext(
                title: "Name",
                subtitle: widget.user.name.toString(),
                controller: _nameedit,
              ),
              const SizedBox(height: 20),
              Edittext(
                title: "DOB",
                subtitle: widget.user.dob.toString(),
                controller: _dobedit,
              ),
              const SizedBox(height: 20),
              Edittext(
                title: "Gender",
                subtitle: widget.user.gender.toString(),
                controller: _genderedit,
              ),
            ],
          )),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  aadharNo = _aadharNoedit.text == ""
                      ? widget.user.aadharno
                      : _aadharNoedit.text;
                  dob = _dobedit.text == "" ? widget.user.dob : _dobedit.text;
                  gender = _genderedit.text == ""
                      ? widget.user.gender
                      : _genderedit.text;
                  name =
                      _nameedit.text == "" ? widget.user.name : _nameedit.text;
                });
                update();
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
