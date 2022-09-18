// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verb_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VerbFormModel _$$_VerbFormModelFromJson(Map<String, dynamic> json) =>
    _$_VerbFormModel(
      title: json['title'] as String? ?? '',
      selectedCardIndex: json['selectedCardIndex'] as int? ?? 1,
      lstVerbForms: json['lstVerbForms'] as List<dynamic>? ?? [],
    );

Map<String, dynamic> _$$_VerbFormModelToJson(_$_VerbFormModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'selectedCardIndex': instance.selectedCardIndex,
      'lstVerbForms': instance.lstVerbForms,
    };
