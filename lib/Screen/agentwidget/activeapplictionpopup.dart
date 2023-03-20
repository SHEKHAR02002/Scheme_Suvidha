import 'package:flutter/material.dart';
import 'package:scheme/Screen/Agent/agentbottomsheet.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/api/agentfuncation.dart';
import 'package:scheme/model/usermodel.dart';

class ActiveApplication extends StatelessWidget {
  final UserModel applicationdetails;
  final String? userid, username;
  const ActiveApplication(
      {super.key,
      required this.username,
      required this.userid,
      required this.applicationdetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 150),
      child: AlertDialog(
        content: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Activate This Application",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text("Application Id : $userid"),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Text("User Name:\n$username"),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 50),
                        backgroundColor: primary,
                        elevation: 0),
                    onPressed: () {
                      activeapplication(applicationdetails: applicationdetails);

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNavigator()),
                          (route) => false);
                    },
                    child: const Text(
                      "Activate",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
