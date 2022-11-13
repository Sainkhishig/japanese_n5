// import 'package:hishig_erdem/common/hive/grammar/xl_grammar_box.dart';
// import 'package:hishig_erdem/hive_db/boxes/hive_box_class.dart';

// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// final grammarDataProvider =
//     Provider<GrammarBox>((ref) => throw UnimplementedError());

// class GrammarBox extends HiveBoxClass {
//   GrammarBox(Box box) : super(box) {}
//   List<XlGrammarBox> get lstAllGrammar =>
//       (box.get("Grammar") as List<XlGrammarBox>);
//   List<XlGrammarBox> get n5Grammars =>
//       (box.get("Grammar") as List<XlGrammarBox>)
//           .where((grammar) => grammar.level == 5)
//           .toList();
//   List<XlGrammarBox> get n5Grammars =>
//       (box.get("Grammar") as List<XlGrammarBox>)
//           .where((grammar) => grammar.level == 5)
//           .toList();
//   List<XlGrammarBox> get n4Grammars =>
//       (box.get("Grammar") as List<XlGrammarBox>)
//           .where((grammar) => grammar.level == 5)
//           .toList();
//   List<XlGrammarBox> get n3Grammars =>
//       (box.get("Grammar") as List<XlGrammarBox>)
//           .where((grammar) => grammar.level == 5)
//           .toList();
//   List<XlGrammarBox> get n2Grammars =>
//       (box.get("Grammar") as List<XlGrammarBox>)
//           .where((grammar) => grammar.level == 5)
//           .toList();
//   // dynamic get lstN5VocAdverb => box.get("csvadverb");
//   // dynamic get lstN5VocParticle => box.get("csvparticle");
// }
