import 'package:flutter/material.dart';
import 'package:scheme/Screen/agentwidget/passconfirm.dart';
import 'package:scheme/Screen/login.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/data/userdata.dart';

class AgentRegistration extends StatefulWidget {
  const AgentRegistration({super.key});

  @override
  State<AgentRegistration> createState() => _AgentRegistrationState();
}

class _AgentRegistrationState extends State<AgentRegistration> {
  final TextEditingController _agentname = TextEditingController();
  final TextEditingController _agentgender = TextEditingController();
  final TextEditingController _agentdob = TextEditingController();
  final TextEditingController _agentoccuption = TextEditingController();
  final TextEditingController _agentaddress = TextEditingController();
  final TextEditingController _agentpincode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const Login()),
                  (route) => false);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: const Text(
          "Registration Form",
          style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w400,
              fontFamily: "Zilla"),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: TextStyle(
                  color: black,
                  fontFamily: "Overpass",
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 45,
              decoration: shadowdecoration,
              child: TextField(
                // keyboardType: TextInputType.number,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5)),
                ),
                controller: _agentname,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Gender",
              style: TextStyle(
                  color: black,
                  fontFamily: "Overpass",
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 45,
              decoration: shadowdecoration,
              child: TextField(
                // keyboardType: TextInputType.number,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5)),
                ),
                controller: _agentgender,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "DOB",
              style: TextStyle(
                  color: black,
                  fontFamily: "Overpass",
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 45,
              decoration: shadowdecoration,
              child: TextField(
                // keyboardType: TextInputType.number,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5)),
                ),
                controller: _agentdob,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Occupation",
              style: TextStyle(
                  color: black,
                  fontFamily: "Overpass",
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 45,
              decoration: shadowdecoration,
              child: TextField(
                // keyboardType: TextInputType.number,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5)),
                ),
                controller: _agentoccuption,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Address",
              style: TextStyle(
                  color: black,
                  fontFamily: "Overpass",
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 45,
              decoration: shadowdecoration,
              child: TextField(
                // keyboardType: TextInputType.number,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5)),
                ),
                controller: _agentaddress,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Pincode",
              style: TextStyle(
                  color: black,
                  fontFamily: "Overpass",
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 45,
              decoration: shadowdecoration,
              child: TextField(
                // keyboardType: TextInputType.number,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5)),
                ),
                controller: _agentpincode,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
            onPressed: () {
              // var agentDetails = {
              //   "name": _agentname.text,
              //   "address": _agentaddress.text,
              //   "gender": _agentgender.text,
              //   "dob": _agentdob.text,
              //   "pincode": _agentpincode.text,
              //   "occuption": _agentoccuption.text,
              // };

              setState(() {
                if (_agentname.text != "" &&
                    _agentgender.text == "" &&
                    _agentdob.text != "" &&
                    _agentoccuption.text != "" &&
                    _agentaddress.text != "" &&
                    _agentpincode.text != "") {}
                agentname = _agentname.text;
                agentgender = _agentgender.text;
                agentdob = _agentdob.text;
                agentoccupation = _agentoccuption.text;
                agentaddress = _agentaddress.text;
                agentpincode = _agentpincode.text;
              });

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PassConfirm(
                          // angetDetails: agentDetails,
                          )));
            },
            style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor: primary,
                minimumSize: Size(width, 50)),
            child: const Text(
              "Next",
              style: TextStyle(
                  fontFamily: "Overpass",
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            )),
      ),
    );
  }
}
