import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scheme/Screen/splash.dart';
import 'package:scheme/firebase_options.dart';
import 'Theme/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Overpass",
        scaffoldBackgroundColor: bgcolor,
        primaryColor: primary,
        // colorScheme: ColorScheme(background: bgcolor),
      ),
      home: const Main(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Splash();
  }
}
