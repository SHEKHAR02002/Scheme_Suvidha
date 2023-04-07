import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';
import 'package:scheme/Screen/registrationscreens/aadharcardupload.dart';
import 'package:scheme/Screen/registrationscreens/udidcardupload.dart';
import 'package:scheme/Screen/registrationscreens/upload.dart';
import 'package:scheme/data/userdata.dart';

void handleCommand(
    Map<String, dynamic> command, BuildContext context, Function getfunc) {
  switch (command["command"]) {
    case "ngo":
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => const FoundationScreen()));
      break;
    case "registration":
      if (registration) {
        AlanVoice.playText("Your Registration is completed");
      } else {
        AlanVoice.playText("Getting started with your Registration process.");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const UploadDoument()));
      }
      break;
    case "take pic":
      if (screenSate == "userphotopage") {
        takepicImage();
      }
      break;
    // case "getadhar":
    //   getfunc(addharNo, command["text"]);
    //   break;
    // case "getName":
    //   getfunc(beneficiaryName, command["text"]);

    //   break;
    // case "getFName":
    //   getfunc(fnhName, command["text"]);
    //   break;
    // case "getgender":
    //   getfunc(gender, command["text"]);
    //   break;
    // case "getdate":
    //   getfunc(doB, command["date"]);
    //   break;
    // case "getphone":
    //   getfunc(phoneNo, command["text"]);
    //   break;
    // case "getAddress":
    //   getfunc(addharNo, command["text"]);
    //   break;
    // case "getofficer":
    //   getfunc(lendername, command["text"]);
    //   break;
    // case "getprivate":
    //   getfunc(hospitalName, command["text"]);
    //   break;
    // case "getdoctor":
    //   getfunc(doctorName, command["text"]);
    //   break;
    case "go next":
      if (screenSate == "userphoto") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AadharCard()));
      } else if (screenSate == "addharcardpage") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const UdidCardUpload()));
      } else if (screenSate == "Home") {}
      break;
    case "go back":
      Navigator.pop(context);
      break;
    default:
      AlanVoice.playText(
          "Unknow Command , please see the help page what things , I can do");
  }
}
