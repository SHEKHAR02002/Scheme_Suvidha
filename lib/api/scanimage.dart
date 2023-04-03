import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

Future getAadharDetails({required String path}) async {
  // String url = "https://aaddhar-ocr-2.onrender.com";
  String url = "https://aadhar-ocr-eeq2wazx3q-el.a.run.app";
  MultipartRequest request = MultipartRequest(
    'POST',
    Uri.parse(url),
  );

  if (kDebugMode) {
    print(path);
  }
  request.headers.addAll(
      {"Accept": "application/json", "content-type": "application/json"});
  // request.headers;
  request.files.add(await MultipartFile.fromPath('file', path));
  // var res = await request.send();
  Response response = await Response.fromStream(await request.send());
  if (response.body == "data invaild" || response.body.toString() == "EOF") {
    return null;
  }
  if (response.statusCode != 200) {
    return null;
  }
  return jsonDecode(response.body);
}

Future getUDIDDetails({required String path}) async {
  // String url = "https://aaddhar-ocr-2.onrender.com/udid";
  String url = "https://aadhar-ocr-eeq2wazx3q-el.a.run.app/udid";
  MultipartRequest request = MultipartRequest(
    'POST',
    Uri.parse(url),
  );

  if (kDebugMode) {
    print(path);
  }
  request.headers.addAll(
      {"Accept": "application/json", "content-type": "application/json"});
  // request.headers;
  request.files.add(await MultipartFile.fromPath('file', path));
  // var res = await request.send();
  Response response = await Response.fromStream(await request.send());
  if (response.body == "data invaild" || response.body.toString() == "EOF") {
    return null;
  }
  if (response.statusCode != 200) {
    return null;
  }
  return jsonDecode(response.body);
}
