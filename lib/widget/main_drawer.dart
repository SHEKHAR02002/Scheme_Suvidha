import 'package:flutter/material.dart';
import 'package:scheme/Screen/norecord.dart';
import 'package:scheme/Theme/color.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 350,
          color: hcontainer,
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoS96_vETK55r95MRsFeB2f7T3S6W6UCsElsdeeOwljS2Ugdwyfo8w4FLzrmFF6VpdkUk&usqp=CAU"))),
              ),
              SizedBox(height: 10),
              Text(
                "UserName",
                style: TextStyle(
                    fontFamily: 'Overpass',
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Text(
                "+91 9579212952",
                style: TextStyle(
                    fontFamily: 'Overpass', fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NoRecord()));
          },
          leading: Icon(Icons.arrow_right),
          title: Text(
            "Your Applied Scheme",
            style: TextStyle(
                fontFamily: "Overpass",
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NoRecord()));
          },
          leading: Icon(Icons.arrow_right),
          title: Text(
            "Your Scheme History",
            style: TextStyle(
                fontFamily: "Overpass",
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ),
        ListTile(
          onTap: null,
          leading: Icon(Icons.arrow_right),
          title: Text(
            "Profile",
            style: TextStyle(
                fontFamily: "Overpass",
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NoRecord()));
          },
          leading: Icon(Icons.arrow_right),
          title: Text(
            "Dashboard",
            style: TextStyle(
                fontFamily: "Overpass",
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}
