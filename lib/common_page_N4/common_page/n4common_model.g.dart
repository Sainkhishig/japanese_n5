// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'n4common_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_N4CommonPageModel _$$_N4CommonPageModelFromJson(Map<String, dynamic> json) =>
    _$_N4CommonPageModel(
      userName: json['userName'] as String? ?? '',
      title: json['title'] as String? ?? '',
      selectedIndex: json['selectedIndex'] as int? ?? 0,
      isGameMode: json['isGameMode'] as bool? ?? false,
      isShowSpeech: json['isShowSpeech'] as bool? ?? true,
      masterDataDestination:
          json['masterDataDestination'] as String? ?? 'letter',
      vocabularyMenuDestination:
          json['vocabularyMenuDestination'] as String? ?? 'allVocabulary',
    );

Map<String, dynamic> _$$_N4CommonPageModelToJson(
        _$_N4CommonPageModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'title': instance.title,
      'selectedIndex': instance.selectedIndex,
      'isGameMode': instance.isGameMode,
      'isShowSpeech': instance.isShowSpeech,
      'masterDataDestination': instance.masterDataDestination,
      'vocabularyMenuDestination': instance.vocabularyMenuDestination,
    };
