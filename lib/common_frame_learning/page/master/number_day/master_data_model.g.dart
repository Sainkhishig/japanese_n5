// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MasterDataModel _$$_MasterDataModelFromJson(Map<String, dynamic> json) =>
    _$_MasterDataModel(
      title: json['title'] as String? ?? '',
      selectedCardIndex: json['selectedCardIndex'] as int? ?? 1,
      lstWordGroup: json['lstWordGroup'] as List<dynamic>? ?? [],
    );

Map<String, dynamic> _$$_MasterDataModelToJson(_$_MasterDataModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'selectedCardIndex': instance.selectedCardIndex,
      'lstWordGroup': instance.lstWordGroup,
    };
