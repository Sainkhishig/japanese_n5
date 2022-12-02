import 'package:hishig_erdem/n5/test/model/question.dart';

class GrammarTestModel {
  late String key;
  late String name;

  late List vocabularies;
  late List<Question> exercises;
  late DateTime writeDate;

  GrammarTestModel(
      this.name, this.vocabularies, this.exercises, this.writeDate);
  factory GrammarTestModel.fromRTDB(Map<String, dynamic> data) {
    return GrammarTestModel(
        data['name'],
        data['vocabularies'],
        (data['exercises'] as List).map((e) => Question.fromRTDB(e)).toList(),
        data['time'] != null
            ? DateTime.fromMicrosecondsSinceEpoch(data['time'])
            : DateTime.now());
  }
}
