import 'package:flutter/material.dart';

class AgentProfile extends StatefulWidget {
  const AgentProfile({super.key});

  @override
  State<AgentProfile> createState() => _AgentProfileState();
}

class _AgentProfileState extends State<AgentProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Profile")),
    );
  }
}
