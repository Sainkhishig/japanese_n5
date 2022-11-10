class Question {
  late String question;
  late List<AnswerOption> answers;

  Question(this.question, this.answers);
  factory Question.fromRTDB(Map<String, dynamic> data) {
    return Question(
      data['question'],
      (data['answers'] as List).map((e) => AnswerOption.fromRTDB(e)).toList(),
    );
  }
  // toJson() {
  //   return {
  //     "question": question,
  //     "answers": answers,
  //   };
  // }
}

class AnswerOption {
  late String answer;
  late bool isTrue;

  AnswerOption(this.answer, this.isTrue);
  factory AnswerOption.fromRTDB(Map<String, dynamic> data) {
    return AnswerOption(
      data['answer'],
      data['isTrue'],
    );
  }
}
