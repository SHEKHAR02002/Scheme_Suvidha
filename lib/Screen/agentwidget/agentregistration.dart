import 'dart:io';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scheme/Screen/agentlogin.dart';
import 'package:scheme/Screen/agentwidget/passconfirm.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/Theme/decoration.dart';
import 'package:scheme/data/userdata.dart';
import 'package:scheme/provider/imagecopper.dart';

class AgentRegistration extends StatefulWidget {
  const AgentRegistration({super.key});

  @override
  State<AgentRegistration> createState() => _AgentRegistrationState();
}

String? agentimage = "";

class _AgentRegistrationState extends State<AgentRegistration> {
  final TextEditingController _agentname = TextEditingController();
  final TextEditingController _agentgender = TextEditingController();
  final TextEditingController _agentdob = TextEditingController();
  final TextEditingController _agentoccuption = TextEditingController();
  final TextEditingController _agentaddress = TextEditingController();
  final TextEditingController _agentpincode = TextEditingController();
  final TextEditingController _agentphonenumber = TextEditingController();

  String customimage = "";
  bool imagepicked = false;

  Future fireStoreFileUpload(refStorageImage, refImage) async {
    String pathValue = '';
    final firebaseStorageRef =
        FirebaseStorage.instance.ref().child(refStorageImage);
    final uploadTask = firebaseStorageRef.putFile(File(refImage));
    final taskSnapshot = await uploadTask.whenComplete(() {});
    await taskSnapshot.ref.getDownloadURL().then((value) async {
      pathValue = value;
    });

    return pathValue;
  }

  Future<dynamic> picagentImage({
    required source,
  }) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source);
      String cropFile = await userImagecopper(pickedFile: image);
      // final File file = File(image!.path);
      setState(() {
        customimage = cropFile;
        agentimage = customimage;
        imagepicked = true;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    Fluttertoast.showToast(
        msg: AppLocalizations.of(context)!.imagepicked,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: primary,
        textColor: Colors.white,
        fontSize: 20.0);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const AgentLogin()),
                  (route) => false);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Text(
          AppLocalizations.of(context)!.registrationform,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w400,
              fontFamily: "Zilla"),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: GestureDetector(
                  onTap: () => bottomsheet(width: width),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      imagepicked
                          ? Image.file(File(agentimage.toString()))
                          : Image.network(defaultPic, height: 120, width: 120),
                      Positioned(
                        bottom: 7,
                        right: 0,
                        child: Icon(
                          Icons.add_circle_outlined,
                          size: 30,
                          color: primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppLocalizations.of(context)!.name,
              style: TextStyle(
                  color: black,
                  fontFamily: "Overpass",
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 45,
              decoration: shadowdecoration,
              child: TextField(
                // keyboardType: TextInputType.number,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5)),
                ),
                controller: _agentname,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppLocalizations.of(context)!.gender,
              style: TextStyle(
                  color: black,
                  fontFamily: "Overpass",
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 45,
              decoration: shadowdecoration,
              child: TextField(
                // keyboardType: TextInputType.number,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5)),
                ),
                controller: _agentgender,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppLocalizations.of(context)!.dob,
              style: TextStyle(
                  color: black,
                  fontFamily: "Overpass",
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 45,
              decoration: shadowdecoration,
              child: TextField(
                // keyboardType: TextInputType.number,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5)),
                ),
                controller: _agentdob,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppLocalizations.of(context)!.occupation,
              style: TextStyle(
                  color: black,
                  fontFamily: "Overpass",
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 45,
              decoration: shadowdecoration,
              child: TextField(
                // keyboardType: TextInputType.number,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5)),
                ),
                controller: _agentoccuption,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppLocalizations.of(context)!.address,
              style: TextStyle(
                  color: black,
                  fontFamily: "Overpass",
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 45,
              decoration: shadowdecoration,
              child: TextField(
                // keyboardType: TextInputType.number,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5)),
                ),
                controller: _agentaddress,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppLocalizations.of(context)!.pincode,
              style: TextStyle(
                  color: black,
                  fontFamily: "Overpass",
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 45,
              decoration: shadowdecoration,
              child: TextField(
                // keyboardType: TextInputType.number,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5)),
                ),
                controller: _agentpincode,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppLocalizations.of(context)!.phoneno,
              style: TextStyle(
                  color: black,
                  fontFamily: "Overpass",
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 45,
              decoration: shadowdecoration,
              child: TextField(
                keyboardType: TextInputType.number,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5)),
                ),
                controller: _agentphonenumber,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                if (_agentname.text != "" &&
                    _agentgender.text == "" &&
                    _agentdob.text != "" &&
                    _agentoccuption.text != "" &&
                    _agentaddress.text != "" &&
                    _agentpincode.text != "" &&
                    _agentphonenumber.text != "") {}
                agentname = _agentname.text;
                agentgender = _agentgender.text;
                agentdob = _agentdob.text;
                agentoccupation = _agentoccuption.text;
                agentaddress = _agentaddress.text;
                agentpincode = _agentpincode.text;
                agentphonenumber = _agentphonenumber.text;
              });

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PassConfirm(
                            customimage: customimage,
                          )));
            },
            style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor: primary,
                minimumSize: Size(width, 50)),
            child: Text(
              AppLocalizations.of(context)!.next,
              style: const TextStyle(
                  fontFamily: "Overpass",
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            )),
      ),
    );
  }

  Future bottomsheet({required double width}) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      backgroundColor: Colors.white,
      builder: (BuildContext context) => Container(
        // height: height / 4,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!.selectimg,
                  style: const TextStyle(
                      fontSize: 30,
                      fontFamily: "Zilla",
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () =>
                              picagentImage(source: ImageSource.camera),
                          child: Icon(
                            Icons.camera,
                            size: 50,
                            color: primary,
                          ),
                        ),
                        Text(AppLocalizations.of(context)!.camera)
                      ],
                    ),
                    SizedBox(
                      width: width / 3,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () =>
                              picagentImage(source: ImageSource.gallery),
                          child: Icon(
                            Icons.image,
                            size: 50,
                            color: primary,
                          ),
                        ),
                        Text(AppLocalizations.of(context)!.gallery)
                      ],
                    ),
                  ],
                ),
                customimage == ""
                    ? const SizedBox.shrink()
                    : ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          foregroundColor: Colors.white,
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        icon: const Icon(Icons.image),
                        onPressed: () {
                          setState(() {
                            customimage = "";
                          });
                        },
                        label: Text(
                          AppLocalizations.of(context)!.removeprofilepic,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
      context: context,
    );
  }
}
