// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_vocabulary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImportVocabularyModel _$$_ImportVocabularyModelFromJson(
        Map<String, dynamic> json) =>
    _$_ImportVocabularyModel(
      lstTableServingProgress:
          json['lstTableServingProgress'] as List<dynamic>? ?? [],
      selectedCardIndex: json['selectedCardIndex'] as int? ?? 1,
      jlptLevel: json['jlptLevel'] as int? ?? 1,
    );

Map<String, dynamic> _$$_ImportVocabularyModelToJson(
        _$_ImportVocabularyModel instance) =>
    <String, dynamic>{
      'lstTableServingProgress': instance.lstTableServingProgress,
      'selectedCardIndex': instance.selectedCardIndex,
      'jlptLevel': instance.jlptLevel,
    };
