import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/widget/agentinfocard.dart';

class KnowAgent extends StatefulWidget {
  const KnowAgent({super.key});

  @override
  State<KnowAgent> createState() => _KnowAgentState();
}

class _KnowAgentState extends State<KnowAgent> {
  List agentlist = [];
  bool agentloader = false;

  Future getagentdetail() async {
    await FirebaseFirestore.instance
        .collection('AgentUser')
        .where('verification', isEqualTo: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        agentlist.add(doc.data());
      }
    }).whenComplete(() => setState(() => agentloader = false));
  }

  @override
  void initState() {
    getagentdetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgcolor,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: black,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Verified Agents",
          style: TextStyle(
              color: black,
              fontFamily: "Zilla",
              fontSize: 22,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: agentlist.length,
            itemBuilder: (context, index) {
              return agentloader
                  ? const CircularProgressIndicator()
                  : AgentCard(
                      address: agentlist[index]['address'],
                      name: agentlist[index]['name'],
                      contact: "9579212952",
                      // contact: agentlist[index]['contact'],
                    );
            }),
      ),
    );
  }
}
