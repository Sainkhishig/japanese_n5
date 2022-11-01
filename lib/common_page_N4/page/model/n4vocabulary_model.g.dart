// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'n4vocabulary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_N4VocabularyModel _$$_N4VocabularyModelFromJson(Map<String, dynamic> json) =>
    _$_N4VocabularyModel(
      lstVocabulary: json['lstVocabulary'] as List<dynamic>? ?? [],
      selectedCardIndex: json['selectedCardIndex'] as int? ?? 1,
      pageIndex: json['pageIndex'] as int? ?? 1,
      dbName: json['dbName'] as String? ?? 'N5Words',
      dbNameIndex: json['dbNameIndex'] as int? ?? 0,
      searchKey: json['searchKey'] as String? ?? '',
    );

Map<String, dynamic> _$$_N4VocabularyModelToJson(
        _$_N4VocabularyModel instance) =>
    <String, dynamic>{
      'lstVocabulary': instance.lstVocabulary,
      'selectedCardIndex': instance.selectedCardIndex,
      'pageIndex': instance.pageIndex,
      'dbName': instance.dbName,
      'dbNameIndex': instance.dbNameIndex,
      'searchKey': instance.searchKey,
    };
