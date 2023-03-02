import 'package:flutter/material.dart';
import 'package:scheme/Screen/Agent/udiddetails.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Registration Form",
        style:TextStyle(
          fontFamily: "Zilla Slab",
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: primary,
        )),
      ),
      body: SingleChildScrollView(
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal:10,vertical:10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text("Agent Name",
            style:TextStyle(
              fontFamily: "Overpass",
              fontSize: 20,
              fontWeight: FontWeight.w400,
            )),
            SizedBox(height: 5),
            Container(
              decoration: shadowdecoration,
              child: TextField (
                    style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(15),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
              ),
            ),
            SizedBox(height: 20),
            Text("Email ID",
            style:TextStyle(
              fontFamily: "Overpass",
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            ),
            SizedBox(height: 5),
            Container(
              decoration: shadowdecoration,
              child: TextField (
                    style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(15),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10)),
                                  
                            ),
                            
              ),
            ),
            SizedBox(height: 20),
            Text("Aadhar Card Details",
            style:TextStyle(
              fontFamily: "Overpass",
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: primary,
            ),
            ),
            SizedBox(height: 20),
            Text("Aadhar Card No",
            style:TextStyle(
              fontFamily: "Overpass",
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            ),
            SizedBox(height: 5),
            Container(
              decoration: shadowdecoration,
              child: TextField (
                    style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(15),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10)),
                                  
                            ),      
              ),
            ),
            SizedBox(height: 20),
            Text("Name",
            style:TextStyle(
              fontFamily: "Overpass",
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            ),
            SizedBox(height: 5),
            Container(
              decoration: shadowdecoration,
              child: TextField (
                    style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(15),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10)),
                                  
                            ),
                            
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("DOB",
                    style:TextStyle(
                      fontFamily: "Overpass",
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    ),
                     SizedBox(height: 5),
                Container(
                  height: 50,
                        width: width / 2.4,
                  decoration: shadowdecoration,
                  child: TextField (
                        style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(15),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10)),
                                      
                                ),      
                  ),
                ),
                  ],
                ),
                Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Gender",
                style:TextStyle(
                  fontFamily: "Overpass",
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                ),
                 SizedBox(height: 5),
            Container(
              height: 50,
                        width: width / 2.4,
              decoration: shadowdecoration,
              child: TextField (
                    style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(15),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10)), 
                                  
                            ),      
              ),
            ),
              ],
            ),
              ],
            ),
            SizedBox(height: 20),
            Text("Phone No.",
            style:TextStyle(
              fontFamily: "Overpass",
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            ),
            SizedBox(height: 5),
            Container(
              decoration: shadowdecoration,
              child: TextField (
                    style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(15),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10)),
                                  
                            ),
                            
              ),
            ),
                    SizedBox(height: 40),
                 ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: Size(350, 50)),
                onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>UdidDetails())),
                child: Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                )),
                ],
              ),
        ),
      ),
    );
  }
}