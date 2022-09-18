// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pronoun_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PronounModel _$$_PronounModelFromJson(Map<String, dynamic> json) =>
    _$_PronounModel(
      title: json['title'] as String? ?? '',
      selectedCardIndex: json['selectedCardIndex'] as int? ?? 1,
      lstLetter: json['lstLetter'] as List<dynamic>? ?? [],
      lstSample: json['lstSample'] as List<dynamic>? ?? [],
    );

Map<String, dynamic> _$$_PronounModelToJson(_$_PronounModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'selectedCardIndex': instance.selectedCardIndex,
      'lstLetter': instance.lstLetter,
      'lstSample': instance.lstSample,
    };
