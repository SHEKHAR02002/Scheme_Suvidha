// import 'package:googleapis_translatetext_v3/googleapis_translatetext_v3.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class TranslationService {
  final String _url =
      "https://translation.googleapis.com/language/translate/v2";
  // final String _apiKey = "AIzaSyCyUjweFFntNv9NkVuqIc6tkwrqOSL7RHM";
  final String _apiKey = "";

  // TranslationService(this._projectId, this._serviceAccountJsonKey);

  Future<String> translate(
      {required String text, required String targetLanguage}) async {
    if (_apiKey == "") {
      return text;
    }
    var respones = await http.post(
      Uri.parse(_url),
      body: {"q": text, "key": _apiKey, "source": "en", "target": "Hi"},
    );
    // final credentials =
    //     ServiceAccountCredentials.fromJson(json.decode(_serviceAccountJsonKey));
    // // final scopes = [cloudTranslationScope.toString()];
    // final client = await clientViaServiceAccount(credentials, scopes);

    // final request = TranslateTextRequest()
    //   ..contents = [text]
    //   ..targetLanguageCode = targetLanguage;
    var newText = "";
    var data = json.decode(respones.body);
    if (respones.statusCode != 200) {
      // print(text);
      return text;
    }
    for (var newtext in data["data"]["translations"]) {
      newText = newtext["translatedText"];
    }
    // final response = await TranslateTextApi(client)
    //     .projects
    //     .locations
    //     .batchTranslateText(request, 'projects/$_projectId/locations/global');
    print(newText.toString());

    return newText.toString();
  }
}
