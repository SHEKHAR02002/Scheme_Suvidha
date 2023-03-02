import 'package:flutter/material.dart';
import 'package:scheme/Theme/decoration.dart';

class ApplicationCard extends StatefulWidget {
  const ApplicationCard({super.key});

  @override
  State<ApplicationCard> createState() => _ApplicationCardState();
}

class _ApplicationCardState extends State<ApplicationCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/scheme-suvidha-admin.appspot.com/o/miscellaneous%2Fdefalutprofile.png?alt=media&token=fbf2357d-d893-43a7-9bcc-412f454691c4",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:const  [
                    Text(
                      'ADIP scheme',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Applicant: Danny Danzoupa',
                      style: TextStyle(
                          color: Color(
                            0xff545454,
                          ),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      const Positioned(
        top: 20,
        right: 20,
        child: Text(
          "05 March 23",
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Color(
              0xff545454,
            ),
          ),
        ),
      )
    ]);
  }
}
