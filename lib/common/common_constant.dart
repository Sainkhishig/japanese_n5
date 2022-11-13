var lstHiveInfo = <HiveInfo>[
  HiveInfo(1, 'KanjiXlN1', 'GrammarXlN1', 'VocabularyXlN1'),
  HiveInfo(2, 'KanjiXlN2', 'GrammarXlN2', 'VocabularyXlN2'),
  HiveInfo(3, 'KanjiXlN3', 'GrammarXlN3', 'VocabularyXlN3'),
  HiveInfo(3, 'KanjiXlN4', 'GrammarXlN4', 'VocabularyXlN4'),
  HiveInfo(5, 'KanjiXlN5', 'GrammarXlN5', 'VocabularyXlN5'),
];

class HiveInfo {
  late int jlptLevel;
  late String kanjiHive;
  late String grammarHive;
  late String vocabularyHive;

  HiveInfo(
      this.jlptLevel, this.kanjiHive, this.grammarHive, this.vocabularyHive);
}
