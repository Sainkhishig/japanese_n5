// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VocabularyModel _$$_VocabularyModelFromJson(Map<String, dynamic> json) =>
    _$_VocabularyModel(
      lstVocabulary: json['lstVocabulary'] as List<dynamic>? ?? [],
      selectedCardIndex: json['selectedCardIndex'] as int? ?? 1,
      jlptLevel: json['jlptLevel'] as int? ?? 1,
      searchKey: json['searchKey'] as String? ?? '',
    );

Map<String, dynamic> _$$_VocabularyModelToJson(_$_VocabularyModel instance) =>
    <String, dynamic>{
      'lstVocabulary': instance.lstVocabulary,
      'selectedCardIndex': instance.selectedCardIndex,
      'jlptLevel': instance.jlptLevel,
      'searchKey': instance.searchKey,
    };
