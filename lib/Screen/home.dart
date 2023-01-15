import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text("Home Page"));
  }
}

// ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       fixedSize: const Size(250, 50),
//                       elevation: 0,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12)),
//                       backgroundColor: button),
//                   onPressed: () => PhoneAuth().logOut(context: context),
//                   child: const Text(
//                     "Logout",
//                     style: TextStyle(
//                         fontFamily: 'Overpass',
//                         fontSize: 24,
//                         fontWeight: FontWeight.w700),
//                   )),