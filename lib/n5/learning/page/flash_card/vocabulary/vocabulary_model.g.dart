// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VocabularyModel _$$_VocabularyModelFromJson(Map<String, dynamic> json) =>
    _$_VocabularyModel(
      lstVocabulary: json['lstVocabulary'] as List<dynamic>? ?? [],
      selectedKanjiIndex: json['selectedKanjiIndex'] as int? ?? 0,
      selectedKanjiInfo: json['selectedKanjiInfo'] ?? null,
      selectedCardIndex: json['selectedCardIndex'] as int? ?? 1,
      selectedPageIndex: json['selectedPageIndex'] as int? ?? 1,
      pageIndex: json['pageIndex'] as int? ?? 1,
      dbName: json['dbName'] as String? ?? 'N5Words',
      dbNameIndex: json['dbNameIndex'] as int? ?? 0,
      searchKey: json['searchKey'] as String? ?? '',
    );

Map<String, dynamic> _$$_VocabularyModelToJson(_$_VocabularyModel instance) =>
    <String, dynamic>{
      'lstVocabulary': instance.lstVocabulary,
      'selectedKanjiIndex': instance.selectedKanjiIndex,
      'selectedKanjiInfo': instance.selectedKanjiInfo,
      'selectedCardIndex': instance.selectedCardIndex,
      'selectedPageIndex': instance.selectedPageIndex,
      'pageIndex': instance.pageIndex,
      'dbName': instance.dbName,
      'dbNameIndex': instance.dbNameIndex,
      'searchKey': instance.searchKey,
    };
