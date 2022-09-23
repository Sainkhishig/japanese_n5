// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_serving_progress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TableServingProgressModel _$$_TableServingProgressModelFromJson(
        Map<String, dynamic> json) =>
    _$_TableServingProgressModel(
      lstTableServingProgress:
          json['lstTableServingProgress'] as List<dynamic>? ?? [],
      selectedCardIndex: json['selectedCardIndex'] as int? ?? 1,
      jlptLevel: json['jlptLevel'] as int? ?? 1,
      searchKey: json['searchKey'] as String? ?? '',
    );

Map<String, dynamic> _$$_TableServingProgressModelToJson(
        _$_TableServingProgressModel instance) =>
    <String, dynamic>{
      'lstTableServingProgress': instance.lstTableServingProgress,
      'selectedCardIndex': instance.selectedCardIndex,
      'jlptLevel': instance.jlptLevel,
      'searchKey': instance.searchKey,
    };
