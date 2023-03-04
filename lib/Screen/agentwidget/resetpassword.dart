import 'package:flutter/material.dart';
import 'package:scheme/Theme/decoration.dart';
class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: const Text(
          "Reset Password",
          style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w400,
              fontFamily: "Zilla"),
        ),
        
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
        child: Column(
          
          children:  [
      
            Container(
                  height: 45,
                  decoration: shadowdecoration,
                  child: TextField(
                    // keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      hintText: "Existing password",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    
                  ),
                ), 
                 SizedBox(height: 30,),
                  Container(
                  height: 45,
                  decoration: shadowdecoration,
                  child: TextField(
                    // keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      hintText: "New Password",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    
                  ),
                ),
                SizedBox(height: 30,),
                  Container(
                  height: 45,
                  decoration: shadowdecoration,
                  child: TextField(
                    // keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      hintText: "Confirm Password",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    
                  ),
                ),
      
        ],),
      ),
    );
  }
}