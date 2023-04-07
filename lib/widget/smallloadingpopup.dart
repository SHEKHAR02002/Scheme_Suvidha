import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SmallLoading extends StatelessWidget {
  const SmallLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(vertical: 300),
        child: SpinKitCircle(
          color: Colors.white,
        ));
  }
}
