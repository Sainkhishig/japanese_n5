import 'package:hishig_erdem/classes/number_order.dart';

class CounterGroup {
  late NumberOrder sampleCounter;
  late String wordMn;
  late String kanji;
  late String wordEN;
  late String reading;

  CounterGroup(
      this.wordEN, this.kanji, this.reading, this.wordMn, this.sampleCounter);
}
