// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listening_test_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListeningTestState _$$_ListeningTestStateFromJson(
        Map<String, dynamic> json) =>
    _$_ListeningTestState(
      audioSource: json['audioSource'] as List<dynamic>? ?? [],
      imageSource: json['imageSource'] as List<dynamic>? ?? [],
      selectedId: json['selectedId'] as String? ?? null,
    );

Map<String, dynamic> _$$_ListeningTestStateToJson(
        _$_ListeningTestState instance) =>
    <String, dynamic>{
      'audioSource': instance.audioSource,
      'imageSource': instance.imageSource,
      'selectedId': instance.selectedId,
    };
