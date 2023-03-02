import 'package:flutter/material.dart';
import 'package:scheme/Screen/Agent/registrationform.dart';
import 'package:scheme/Theme/color.dart';

class AgentHome extends StatefulWidget {
  const AgentHome({super.key});

  @override
  State<AgentHome> createState() => _AgentHomeState();
}

class _AgentHomeState extends State<AgentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    SingleChildScrollView(
      child:Padding(
        padding: const EdgeInsets.all(40),
        child: ElevatedButton(
          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationForm())), 
          child: Text("Go to Registration page"),
          style: ElevatedButton.styleFrom(
              backgroundColor: primary)
          ),
      ),));
  }
}
