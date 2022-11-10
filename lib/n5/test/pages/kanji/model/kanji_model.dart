import 'package:hishig_erdem/n5/test/model/question.dart';

class KanjiTestModel {
  late String key;
  late String name;
  late List vocabularies;
  late List<Question> exercises;
  late DateTime writeDate;

  KanjiTestModel(this.name, this.vocabularies, this.exercises, this.writeDate);
  factory KanjiTestModel.fromRTDB(Map<String, dynamic> data) {
    return KanjiTestModel(
        data['name'],
        data['vocabularies'],
        (data['exercises'] as List).map((e) => Question.fromRTDB(e)).toList(),
        data['time'] != null
            ? DateTime.fromMicrosecondsSinceEpoch(data['time'])
            : DateTime.now());
  }
}
