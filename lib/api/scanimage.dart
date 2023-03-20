import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

Future getAadharDetails({required String path}) async {
  String url = "https://aaddhar-ocr-2.onrender.com";
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
  if (response.body == "data invaild") {
    return null;
  }
  return jsonDecode(response.body);
}

Future getUDIDDetails({required String path}) async {
  String url = "https://aaddhar-ocr-2.onrender.com/udid";
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
  if (response.body == "data invaild") {
    return null;
  }
  return jsonDecode(response.body);
}
