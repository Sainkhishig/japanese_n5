import '../main.dart';

Future speak(String speechText) async {
  await flutterTts.setVolume(0.5);
  await flutterTts.setSpeechRate(0.5);
  await flutterTts.setPitch(1);

  if (speechText.isNotEmpty) {
    await flutterTts.speak(speechText);
  }
}
