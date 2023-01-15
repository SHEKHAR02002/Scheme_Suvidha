import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:scheme/Theme/color.dart';
import 'package:scheme/provider/phoneauth.dart';

class OtpBottomSheet extends StatefulWidget {
  final String phoneNumber, verificationId;
  const OtpBottomSheet({
    Key? key,
    required this.phoneNumber,
    required this.verificationId,
  }) : super(key: key);

  @override
  State<OtpBottomSheet> createState() => _OtpBottomSheetState();
}

class _OtpBottomSheetState extends State<OtpBottomSheet> {
  final TextEditingController _smsCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView();
  }
}

// Pinput(
//               length: 6,
//               controller: _smsCode,
//               onCompleted: (pin) => PhoneAuth().submitOpt(
//                   verificationId: widget.verificationId,
//                   smsCode: _smsCode.text,
//                   context: context)),