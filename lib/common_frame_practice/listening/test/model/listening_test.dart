class ListeningTest {
  late String key;
  late String name;
  String storagePath = "";

  late int jlptLevel;
  late List vocabularies;
  late List<ListeningQuestion> exercises;
  late DateTime writeDate;

  ListeningTest(this.name, this.jlptLevel, this.vocabularies, this.exercises,
      this.writeDate);
  factory ListeningTest.fromRTDB(Map<String, dynamic> data) {
    return ListeningTest(
        data['name'] ?? "",
        data['jlptLevel'] ?? 5,
        data['vocabularies'],
        (data['exercises'] as List)
            .map((e) => ListeningQuestion.fromRTDB(e))
            .toList(),
        data['time'] != null
            ? DateTime.fromMicrosecondsSinceEpoch(data['time'])
            : DateTime.now());
  }
}

class ListeningQuestion {
  late String question;
  late String audioUrl;
  late String imageUrl;
  late String selectedAnswer = "";
  late List<ListeningAnswerOption> answers;

  ListeningQuestion(this.question, this.audioUrl, this.imageUrl, this.answers);
  factory ListeningQuestion.fromRTDB(Map<String, dynamic> data) {
    return ListeningQuestion(
      data['question'],
      data['audioUrl'] ?? "",
      data['imageUrl'] ?? "",
      (data['answers'] as List)
          .map((e) => ListeningAnswerOption.fromRTDB(e))
          .toList(),
    );
  }
}

class ListeningAnswerOption {
  late String answer;
  late bool isTrue;

  ListeningAnswerOption(this.answer, this.isTrue);
  factory ListeningAnswerOption.fromRTDB(Map<String, dynamic> data) {
    return ListeningAnswerOption(
      data['answer'],
      data['isTrue'],
    );
  }
}
