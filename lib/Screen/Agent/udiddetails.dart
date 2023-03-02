import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
class UdidDetails extends StatefulWidget {
  const UdidDetails({super.key});

  @override
  State<UdidDetails> createState() => _UdidDetailsState();
}

class _UdidDetailsState extends State<UdidDetails> {
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
          padding: const EdgeInsets.symmetric(horizontal:10,vertical:10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text("UDID Card No.",
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
            Text("Disability Type",
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
            Text("Disability Percentage",
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
                                  icon: Padding(
                                    padding:  EdgeInsets.fromLTRB(300, 10,10, 10),
                                    child: Icon(Icons.arrow_drop_down_sharp,
                                    color: Colors.black,),
                                  )
                                  
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