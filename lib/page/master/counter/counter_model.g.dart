// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CounterModel _$$_CounterModelFromJson(Map<String, dynamic> json) =>
    _$_CounterModel(
      title: json['title'] as String? ?? '',
      selectedCardIndex: json['selectedCardIndex'] as int? ?? 1,
      lstWordGroup: json['lstWordGroup'] as List<dynamic>? ?? [],
    );

Map<String, dynamic> _$$_CounterModelToJson(_$_CounterModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'selectedCardIndex': instance.selectedCardIndex,
      'lstWordGroup': instance.lstWordGroup,
    };
