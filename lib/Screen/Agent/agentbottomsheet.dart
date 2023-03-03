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
  bool showNav = true;
  final screen = [
    const AgentHome(),
    const RegistrationForm(),
    const AgentProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    if (mounted) {
      if (selectedIndex == 1) {
        Future.delayed(const Duration(seconds: 3),
            () => setState(() => showNav = selectedIndex == 1 ? false : true));
      } else {
        setState(() => showNav = true);
      }
    }
    return Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: screen,
        ),
        floatingActionButtonLocation: showNav
            ? FloatingActionButtonLocation.centerDocked
            : FloatingActionButtonLocation.endFloat,
        floatingActionButton: showNav
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Card(
                  color: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: GNav(
                      haptic: true,
                      tabs: const [
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      selectedIndex: selectedIndex,
                      onTabChange: (int index) {
                        if (index == selectedIndex && selectedIndex == 0) {
                          const Home();
                        }
                        if (mounted) {
                          setState(() {
                            selectedIndex = index;
                          });
                        }
                      },
                    ),
                  ),
                ),
              )
            : FloatingActionButton(
                foregroundColor: primary,
                backgroundColor: Colors.white,
                child: const Icon(Icons.home),
                onPressed: () => setState(() {
                      selectedIndex = 0;
                    })));
  }
}
