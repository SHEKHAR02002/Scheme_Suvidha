import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:scheme/Screen/Agent/registrationform.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
class UdidDetails extends StatefulWidget {
  const UdidDetails({super.key});

  @override
  State<UdidDetails> createState() => _UdidDetailsState();
}

class _UdidDetailsState extends State<UdidDetails> {
  final List category = [
    "Select Scheme",
    "Health",
    "Pension",
    "Business",
    "Education",
    "Transport",
    "Marriage"
  ];
  String? categorytype = "Select Scheme";
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation:0,
        backgroundColor: Colors.white,
        title:Text("UDID Card Details",
        style:TextStyle(
          fontSize: 20,
          fontFamily: "Overpass",
          fontWeight: FontWeight.w400,
          color: primary,
        ))
      ),
       body: SingleChildScrollView(
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal:20,vertical:20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
            const TextFieldTake(title: "UDID Card No.",),
            const SizedBox(height: 20),
            const TextFieldTake(title: 'Name',),
            const SizedBox(height: 20),
            const TextFieldTake(title: 'Disability Type',),  
            const SizedBox(height: 20),
            const TextFieldTake(title: 'Disability Percentage',),   
            const SizedBox(height: 20),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Date Of Issue",
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
                Text("Valid Upto",
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
            Text("Apply Scheme",
            style:TextStyle(
              fontFamily: "Overpass",
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: primary,
            ),
            ),
            SizedBox(height: 5),
            DropdownButtonHideUnderline(
                      child: Container(
                        width: width,
                        decoration: shadowdecoration,
                        child: DropdownButton2(
                          dropdownDecoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          // buttonDecoration: shadowdecoration,
                          items: category
                              .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Overpass'),
                                    ),
                                  ))
                              .toList(),
                          value: categorytype,
                          onChanged: (value) {
                            categorytype = value as String;
                          },
                        ),
                      ),
                    ),
            // Container(
            //   decoration: shadowdecoration,
            //   child: TextField (
            //         style: TextStyle(
            //               fontSize: 20,
            //               fontWeight: FontWeight.w400,
            //               color: Colors.black,
            //             ),
            //             decoration: InputDecoration(
            //                   contentPadding: const EdgeInsets.all(15),
            //                   filled: true,
            //                   fillColor: Colors.white,
            //                   border: OutlineInputBorder(
            //                       borderSide: BorderSide.none,
            //                       borderRadius: BorderRadius.circular(10)),
            //                       icon: Padding(
            //                         padding:  EdgeInsets.fromLTRB(300, 10,10, 10),
            //                         child: Icon(Icons.arrow_drop_down_sharp,
            //                         color: Colors.black,),
            //                       )
                                  
            //                 ),
                            
            //   ),
            // ),
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
                  "Submit",
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