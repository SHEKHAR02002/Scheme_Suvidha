import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/api/getscheme.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/widget/processingpopup.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _aadharNo = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phoneNo = TextEditingController();

  final TextEditingController _udidNo = TextEditingController();
  final TextEditingController _udidname = TextEditingController();
  final TextEditingController _disbilitytype = TextEditingController();
  final TextEditingController _disabilitypercentage = TextEditingController();
  final TextEditingController _dataissue = TextEditingController();
  final TextEditingController _validupto = TextEditingController();

  void storedata() async {
    if (_aadharNo.text != '' &&
        _name.text != '' &&
        _dob.text != '' &&
        _gender.text != '' &&
        _phoneNo.text != '' &&
        _udidNo.text != '' &&
        _udidname.text != '' &&
        _disbilitytype.text != '' &&
        _disabilitypercentage.text != '' &&
        _dataissue.text != '' &&
        _validupto.text != '') {
      showDialog(
          context: context,
          builder: ((context) =>
              processingPopup(context: context, msg: "Processing....")));
      setState(() {
        aadharNo = _aadharNo.text;
        name = _name.text;
        dob = _dob.text;
        gender = _gender.text;
        phoneNo = _phoneNo.text;

        udidNo = _udidNo.text;
        udidname = _udidname.text;
        disbilitytype = _disbilitytype.text;
        disabilitypercentage = _disabilitypercentage.text;
        dataissue = _dataissue.text;
        validupto = _validupto.text;
      });

      await register(context: context);
    } else {
      Fluttertoast.showToast(
          msg: "Field are Empty",
          toastLength: Toast.LENGTH_LONG,
          fontSize: 20,
          backgroundColor: secondary,
          textColor: Colors.black);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: bgcolor,
            title: Text(
              "Verify your details",
              style: TextStyle(
                  color: black,
                  fontFamily: "Overpass",
                  fontSize: 32,
                  fontWeight: FontWeight.w700),
            )),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Text(
                  "Aadhar Card Details",
                  style: TextStyle(
                      color: primary,
                      fontFamily: "Overpass",
                      fontSize: 26,
                      fontWeight: FontWeight.w400),
                ),
              ),
              aadharform(width: width),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Text(
                  "UDID Card Details",
                  style: TextStyle(
                      color: primary,
                      fontFamily: "Overpass",
                      fontSize: 26,
                      fontWeight: FontWeight.w400),
                ),
              ),
              udidform(width: width)
            ],
          ),
        ),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
            child: ElevatedButton(
                onPressed: () {
                  storedata();
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: primary,
                    minimumSize: Size(width, 50)),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                      fontFamily: "Overpass",
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ))));
  }

  aadharform({required double width}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Aadhar Card No",
            style: TextStyle(
                color: black,
                fontFamily: "Overpass",
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                    color: Color(
                      0x3f000000,
                    ), //New
                    blurRadius: 2.0,
                    offset: Offset(0, 0))
              ],
            ),
            child: TextField(
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(5)),
              ),
              controller: _aadharNo,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Name",
            style: TextStyle(
                color: black,
                fontFamily: "Overpass",
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                    color: Color(
                      0x3f000000,
                    ), //New
                    blurRadius: 4.0,
                    offset: Offset(0, 0))
              ],
            ),
            child: TextField(
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(5)),
              ),
              controller: _name,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "DOB",
                    style: TextStyle(
                        color: black,
                        fontFamily: "Overpass",
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: width / 2.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(
                              0x3f000000,
                            ), //New
                            blurRadius: 4.0,
                            offset: Offset(0, 0))
                      ],
                    ),
                    child: TextField(
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      controller: _dob,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gender",
                    style: TextStyle(
                        color: black,
                        fontFamily: "Overpass",
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: width / 2.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(
                              0x3f000000,
                            ), //New
                            blurRadius: 4.0,
                            offset: Offset(0, 0))
                      ],
                    ),
                    child: TextField(
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      controller: _gender,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Phone No.",
            style: TextStyle(
                color: black,
                fontFamily: "Overpass",
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                    color: Color(
                      0x3f000000,
                    ), //New
                    blurRadius: 4.0,
                    offset: Offset(0, 0))
              ],
            ),
            child: TextField(
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(5)),
              ),
              controller: _phoneNo,
            ),
          ),
        ],
      ),
    );
  }

  udidform({required double width}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "UDID Card No",
            style: TextStyle(
                color: black,
                fontFamily: "Overpass",
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                    color: Color(
                      0x3f000000,
                    ), //New
                    blurRadius: 4.0,
                    offset: Offset(0, 0))
              ],
            ),
            child: TextField(
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(5)),
              ),
              controller: _udidNo,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Name",
            style: TextStyle(
                color: black,
                fontFamily: "Overpass",
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                    color: Color(
                      0x3f000000,
                    ), //New
                    blurRadius: 4.0,
                    offset: Offset(0, 0))
              ],
            ),
            child: TextField(
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(5)),
              ),
              controller: _udidname,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Disability Type",
            style: TextStyle(
                color: black,
                fontFamily: "Overpass",
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                    color: Color(
                      0x3f000000,
                    ), //New
                    blurRadius: 4.0,
                    offset: Offset(0, 0))
              ],
            ),
            child: TextField(
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(5)),
              ),
              controller: _disbilitytype,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Disability Percentage",
            style: TextStyle(
                color: black,
                fontFamily: "Overpass",
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                    color: Color(
                      0x3f000000,
                    ), //New
                    blurRadius: 4.0,
                    offset: Offset(0, 0))
              ],
            ),
            child: TextField(
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(5)),
              ),
              controller: _disabilitypercentage,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date Of Issue",
                    style: TextStyle(
                        color: black,
                        fontFamily: "Overpass",
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: width / 2.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(
                              0x3f000000,
                            ), //New
                            blurRadius: 4.0,
                            offset: Offset(0, 0))
                      ],
                    ),
                    child: TextField(
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      controller: _dataissue,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Valid Upto",
                    style: TextStyle(
                        color: black,
                        fontFamily: "Overpass",
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: width / 2.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(
                              0x3f000000,
                            ), //New
                            blurRadius: 4.0,
                            offset: Offset(0, 0))
                      ],
                    ),
                    child: TextField(
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      controller: _validupto,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
