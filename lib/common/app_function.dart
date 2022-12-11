import 'package:hishig_erdem/common/common_dialog.dart';

import '../main.dart';

Future speak(String speechText) async {
  await flutterTts.setVolume(1.0);
  await flutterTts.setSpeechRate(1);
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

String getTestResultForPercent(double resultPercent) {
  var emotionText = "";
  if (resultPercent == 100) {
    emotionText = "Гайхалтай! Танд баяр хүргэе \u{1f44c}";
  } else if (resultPercent >= 90) {
    emotionText = "Онц! Илүү амжилт хүсье \u{1f44c}";
  } else if (resultPercent >= 80) {
    emotionText = "Сайн байна! Онц дүн ойрхон байна шүү. Амжилт\u{1f44c}";
  } else if (resultPercent >= 50) {
    emotionText = "Дахиад жаахан хичээгээрэй.\u{1f44c}";
  } else {
    emotionText =
        "Харамсалтай байна. Сэтгэлээр бүү унаарай. Алдаа бүхэн амжилтын эхлэл шүү.\u{1f44c}";
  }
  return emotionText;
}

List sliceList(List sliceList, int chunkSize) {
  List slicedList = [];
  int index = 0;
  while (index < sliceList.length) {
    var chunk = sliceList.skip(index).take(chunkSize);
    slicedList.add(chunk.toList());

    index += chunkSize;
  }
  return slicedList;
}

getSlectedTestIndex(lstTest) {
  var todayDay = DateTime.now().day;
  var lstndex = todayDay % lstTest.length;
  return lstndex;
}
