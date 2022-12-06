import 'package:hishig_erdem/n5/test/model/question.dart';

class ReadingTestModel {
  late String key;
  late String name;

  late List vocabularies;
  late List<Reading> exercises;
  late DateTime writeDate;

  ReadingTestModel(
      this.name, this.vocabularies, this.exercises, this.writeDate);
  factory ReadingTestModel.fromRTDB(Map<String, dynamic> data) {
    return ReadingTestModel(
        data['name'],
        data['vocabularies'],
        (data['exercises'] as List).map((e) => Reading.fromRTDB(e)).toList(),
        data['time'] != null
            ? DateTime.fromMicrosecondsSinceEpoch(data['time'])
            : DateTime.now());
  }
}

class Reading {
  late String section;
  late String content;
  late List<Question> questions;

  late DateTime writeDate;
  Reading(this.section, this.content, this.questions);
  factory Reading.fromRTDB(Map<String, dynamic> data) {
    return Reading(
      data['section'],
      data['content'],
      (data['questions'] as List).map((e) => Question.fromRTDB(e)).toList(),
    );
  }
}

// class Question {
//   late String question;
//   late List<AnswerOption> answers;

//   Question(this.question, this.answers);
//   factory Question.fromRTDB(Map<String, dynamic> data) {
//     return Question(
//       data['question'],
//       (data['answers'] as List).map((e) => AnswerOption.fromRTDB(e)).toList(),
//     );
//   }
//   // toJson() {
//   //   return {
//   //     "question": question,
//   //     "answers": answers,
//   //   };
//   // }
// }

// class ReadingModel {
//   late String key;
//   late String name;
//   late String content;
//   late String question;
//   late List<String> answers;
//   late String answer;
//   late DateTime writeDate;
//   ReadingModel(this.name, this.content, this.question, this.answers,
//       this.answer, this.writeDate);
//   factory ReadingModel.fromRTDB(Map<String, dynamic> data) {
//     // print("datakey");
//     // print((data as DataSnapshot).key);
//     return ReadingModel(
//         data['name'],
//         data['content'],
//         data['question'],
//         data['answers'],
//         data['answer'],
//         data['writeDate'] != null
//             ? DateTime.fromMicrosecondsSinceEpoch(data['writeDate'])
//             : DateTime.now());
//   }
// }
