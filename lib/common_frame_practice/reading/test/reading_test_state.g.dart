// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_test_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReadingTestState _$$_ReadingTestStateFromJson(Map<String, dynamic> json) =>
    _$_ReadingTestState(
      tags: json['tags'] as List<dynamic>? ?? [],
      readingTestSource: json['readingTestSource'] as List<dynamic>? ?? [],
      selectedId: json['selectedId'] as String? ?? null,
      selectedReadingTest: json['selectedReadingTest'] ?? null,
    );

Map<String, dynamic> _$$_ReadingTestStateToJson(_$_ReadingTestState instance) =>
    <String, dynamic>{
      'tags': instance.tags,
      'readingTestSource': instance.readingTestSource,
      'selectedId': instance.selectedId,
      'selectedReadingTest': instance.selectedReadingTest,
    };
