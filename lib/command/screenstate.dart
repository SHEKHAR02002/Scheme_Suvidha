import 'package:alan_voice/alan_voice.dart';

void setVisuals(String screen) {
  var visual = "{\"screen\": \"$screen\"}";
  AlanVoice.setVisualState(visual);
}
