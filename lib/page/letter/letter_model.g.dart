// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'letter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LetterModel _$$_LetterModelFromJson(Map<String, dynamic> json) =>
    _$_LetterModel(
      title: json['title'] as String? ?? '',
      selectedCardIndex: json['selectedCardIndex'] as int? ?? 0,
      lstLetter: json['lstLetter'] as List<dynamic>? ?? [],
      lstSample: json['lstSample'] as List<dynamic>? ?? [],
    );

Map<String, dynamic> _$$_LetterModelToJson(_$_LetterModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'selectedCardIndex': instance.selectedCardIndex,
      'lstLetter': instance.lstLetter,
      'lstSample': instance.lstSample,
    };
