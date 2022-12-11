// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grammar_test_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GrammarTestState _$$_GrammarTestStateFromJson(Map<String, dynamic> json) =>
    _$_GrammarTestState(
      tags: json['tags'] as List<dynamic>? ?? [],
      grammarTestSource: json['grammarTestSource'] as List<dynamic>? ?? [],
      selectedId: json['selectedId'] as String? ?? null,
      selectedTestIndex: json['selectedTestIndex'] as int? ?? 0,
    );

Map<String, dynamic> _$$_GrammarTestStateToJson(_$_GrammarTestState instance) =>
    <String, dynamic>{
      'tags': instance.tags,
      'grammarTestSource': instance.grammarTestSource,
      'selectedId': instance.selectedId,
      'selectedTestIndex': instance.selectedTestIndex,
    };
