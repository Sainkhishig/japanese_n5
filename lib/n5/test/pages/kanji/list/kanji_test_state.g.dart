// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kanji_test_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KanjiTestState _$$_KanjiTestStateFromJson(Map<String, dynamic> json) =>
    _$_KanjiTestState(
      tags: json['tags'] as List<dynamic>? ?? [],
      kanjiTestSource: json['kanjiTestSource'] as List<dynamic>? ?? [],
      selectedId: json['selectedId'] as String? ?? null,
      selectedKanjiTest: json['selectedKanjiTest'] ?? null,
    );

Map<String, dynamic> _$$_KanjiTestStateToJson(_$_KanjiTestState instance) =>
    <String, dynamic>{
      'tags': instance.tags,
      'kanjiTestSource': instance.kanjiTestSource,
      'selectedId': instance.selectedId,
      'selectedKanjiTest': instance.selectedKanjiTest,
    };
