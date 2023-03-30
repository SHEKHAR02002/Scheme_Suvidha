import 'package:flutter/material.dart';
import 'package:scheme/Screen/Agent/agenthome.dart';
import 'package:scheme/Screen/Agent/agetprofile.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Screen/registrationscreens/upload.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int currentIndex = 0;

  final screen = [
    const AgentHome(),
    const UploadDoument(),
    const AgentProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screen,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: primary,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => setState(() {
                currentIndex = index;
              }),
          iconSize: 28,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.edit), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: '')
          ]),
    );
  }
}
