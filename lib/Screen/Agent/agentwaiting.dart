import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';

class AgentWaiting extends StatefulWidget {
  const AgentWaiting({super.key});

  @override
  State<AgentWaiting> createState() => _AgentWaitingState();
}

class _AgentWaitingState extends State<AgentWaiting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("animations/agentwaiting.json",
                height: 300, width: 300),
            Text(
              "Wait till we verify your Application",
              style: TextStyle(
                  fontFamily: "Zilla",
                  color: primary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "You will get the notification as soon as it's verified",
              style: TextStyle(
                  fontFamily: "Zilla",
                  color: text2,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
