import 'package:afen_vocabulary/common/common_dialog.dart';

import '../main.dart';

Future speak(String speechText) async {
  await flutterTts.setVolume(0.5);
  await flutterTts.setSpeechRate(0.5);
  flutterTts.setLanguage('ja-JP');
  await flutterTts.setPitch(1);

  if (speechText.isNotEmpty) {
    try {
      await flutterTts.speak(speechText);
    } catch (ex) {
      showErroMessage("speech aldaa", ex.toString());
    }
  }
}

// void speak() {
//   tts.setVolume(volume);
//   tts.setRate(rate);
//   if (languageCode != null) {
//     tts.setLanguage(languageCode!);
//   }
//   tts.setPitch(pitch);
//   tts.speak(text);
// }
