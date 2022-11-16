import 'package:flutter/material.dart';
import 'package:scheme/Screen/splash.dart';
import 'Theme/color.dart';

void main() {
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
        appBarTheme: AppBarTheme(
            centerTitle: true,
            elevation: 0,
            backgroundColor: bgcolor,
            titleTextStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: bgcolor,
            )),
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
