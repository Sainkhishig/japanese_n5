// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommonPageModel _$$_CommonPageModelFromJson(Map<String, dynamic> json) =>
    _$_CommonPageModel(
      userName: json['userName'] as String? ?? '',
      title: json['title'] as String? ?? '',
      selectedIndex: json['selectedIndex'] as int? ?? 0,
      isGameMode: json['isGameMode'] as bool? ?? false,
      masterDataDestination:
          json['masterDataDestination'] as String? ?? 'letter',
      vocabularyMenuDestination:
          json['vocabularyMenuDestination'] as String? ?? 'allVocabulary',
    );

Map<String, dynamic> _$$_CommonPageModelToJson(_$_CommonPageModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'title': instance.title,
      'selectedIndex': instance.selectedIndex,
      'isGameMode': instance.isGameMode,
      'masterDataDestination': instance.masterDataDestination,
      'vocabularyMenuDestination': instance.vocabularyMenuDestination,
    };
