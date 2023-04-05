import 'package:flutter/material.dart';
import 'package:scheme/Screen/agentwidget/verification.dart';
import 'package:scheme/model/usermodel.dart';

class ApplicationCard extends StatefulWidget {
  final UserModel applicationdetails;
  final String userid;
  final bool activate;
  const ApplicationCard(
      {super.key,
      required this.applicationdetails,
      required this.activate,
      required this.userid});

  @override
  State<ApplicationCard> createState() => _ApplicationCardState();
}

class _ApplicationCardState extends State<ApplicationCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        // !widget.activate
        //     ? showDialog(
        //         context: context,
        //         builder: (context) => ActiveApplication(
        //               applicationdetails: widget.applicationdetails,
        //               username: widget.applicationdetails.name.toString(),
        //               userid: widget.applicationdetails.userId.toString(),
        //             ))
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AgentVerification(
                    applicationdetails: widget.applicationdetails)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                color: Color(
                  0x3f000000,
                ), //New
                blurRadius: 1.0,
                offset: Offset(0, 0))
          ],
        ),
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              // fit: BoxFit.cover,
              foregroundImage: widget.applicationdetails.image != null
                  ? NetworkImage(
                      widget.applicationdetails.image!,
                    )
                  : const NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/scheme-suvidha-admin.appspot.com/o/miscellaneous%2Fdefalutprofile.png?alt=media&token=fbf2357d-d893-43a7-9bcc-412f454691c4",
                      // fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: width - 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // overflow: TextOverflow.ellipsis,
                    widget.applicationdetails.name.toString(),
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    widget.applicationdetails.disabilitytype.toString(),
                    style: const TextStyle(
                        color: Color(
                          0xff545454,
                        ),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              widget.applicationdetails.dob.toString(),
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Color(
                  0xff545454,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
