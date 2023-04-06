import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';

class AgentCard extends StatefulWidget {
  final String name, address;
  const AgentCard({
    super.key,
    required this.name,
    required this.address,

    // required this.contact
  });

  @override
  State<AgentCard> createState() => _AgentCardState();
}

class _AgentCardState extends State<AgentCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: shadowdecoration10,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 30,
            // fit: BoxFit.cover,
            foregroundImage: NetworkImage(
              "https://firebasestorage.googleapis.com/v0/b/scheme-suvidha-admin.appspot.com/o/miscellaneous%2Fdefalutprofile.png?alt=media&token=fbf2357d-d893-43a7-9bcc-412f454691c4",
              // fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600, color: primary),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: width / 1.5,
                child: Text(
                  widget.address,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Contact: 8080405089",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    );
  }
}
