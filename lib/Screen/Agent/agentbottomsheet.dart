import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:scheme/Screen/Agent/agenthome.dart';
import 'package:scheme/Screen/Agent/agetprofile.dart';
import 'package:scheme/Screen/Agent/registrationform.dart';
import 'package:scheme/Screen/home.dart';
import 'package:scheme/Theme/color.dart';

int selectedIndex = 0;

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  final screen = [
    const AgentHome(),
    const RegistrationForm(),
    const AgentProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screen,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Visibility(
            child: Card(
          color: Colors.white,
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GNav(
              haptic: true,
              tabs: [
                GButton(
                  icon: Icons.home,
                  // text: "Home",
                ),
                GButton(
                  icon: Icons.add_circle_rounded,
                  // text: "Add",
                ),
                GButton(
                  icon: Icons.person,
                  // text: "Profile",
                )
              ],
              duration: const Duration(milliseconds: 400),
              activeColor: primary,
              tabBorderRadius: 30,
              color: secondary3,
              iconSize: 30,
              gap: 5,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              selectedIndex: selectedIndex,
              onTabChange: (int index) {
                if (index == selectedIndex && selectedIndex == 0) {
                  Home();
                }
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
        )),
      ),
    );
  }
}
