// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'import_vocabulary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImportVocabularyModel _$ImportVocabularyModelFromJson(
    Map<String, dynamic> json) {
  return _ImportVocabularyModel.fromJson(json);
}

/// @nodoc
class _$ImportVocabularyModelTearOff {
  const _$ImportVocabularyModelTearOff();

  _ImportVocabularyModel call(
      {List<dynamic> lstTableServingProgress = const [],
      int selectedCardIndex = 1,
      int jlptLevel = 1}) {
    return _ImportVocabularyModel(
      lstTableServingProgress: lstTableServingProgress,
      selectedCardIndex: selectedCardIndex,
      jlptLevel: jlptLevel,
    );
  }

  ImportVocabularyModel fromJson(Map<String, Object> json) {
    return ImportVocabularyModel.fromJson(json);
  }
}

/// @nodoc
const $ImportVocabularyModel = _$ImportVocabularyModelTearOff();

/// @nodoc
mixin _$ImportVocabularyModel {
  List<dynamic> get lstTableServingProgress =>
      throw _privateConstructorUsedError;
  int get selectedCardIndex => throw _privateConstructorUsedError;
  int get jlptLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImportVocabularyModelCopyWith<ImportVocabularyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImportVocabularyModelCopyWith<$Res> {
  factory $ImportVocabularyModelCopyWith(ImportVocabularyModel value,
          $Res Function(ImportVocabularyModel) then) =
      _$ImportVocabularyModelCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      int jlptLevel});
}

/// @nodoc
class _$ImportVocabularyModelCopyWithImpl<$Res>
    implements $ImportVocabularyModelCopyWith<$Res> {
  _$ImportVocabularyModelCopyWithImpl(this._value, this._then);

  final ImportVocabularyModel _value;
  // ignore: unused_field
  final $Res Function(ImportVocabularyModel) _then;

  @override
  $Res call({
    Object? lstTableServingProgress = freezed,
    Object? selectedCardIndex = freezed,
    Object? jlptLevel = freezed,
  }) {
    return _then(_value.copyWith(
      lstTableServingProgress: lstTableServingProgress == freezed
          ? _value.lstTableServingProgress
          : lstTableServingProgress // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      selectedCardIndex: selectedCardIndex == freezed
          ? _value.selectedCardIndex
          : selectedCardIndex // ignore: cast_nullable_to_non_nullable
              as int,
      jlptLevel: jlptLevel == freezed
          ? _value.jlptLevel
          : jlptLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ImportVocabularyModelCopyWith<$Res>
    implements $ImportVocabularyModelCopyWith<$Res> {
  factory _$ImportVocabularyModelCopyWith(_ImportVocabularyModel value,
          $Res Function(_ImportVocabularyModel) then) =
      __$ImportVocabularyModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      int jlptLevel});
}

/// @nodoc
class __$ImportVocabularyModelCopyWithImpl<$Res>
    extends _$ImportVocabularyModelCopyWithImpl<$Res>
    implements _$ImportVocabularyModelCopyWith<$Res> {
  __$ImportVocabularyModelCopyWithImpl(_ImportVocabularyModel _value,
      $Res Function(_ImportVocabularyModel) _then)
      : super(_value, (v) => _then(v as _ImportVocabularyModel));

  @override
  _ImportVocabularyModel get _value => super._value as _ImportVocabularyModel;

  @override
  $Res call({
    Object? lstTableServingProgress = freezed,
    Object? selectedCardIndex = freezed,
    Object? jlptLevel = freezed,
  }) {
    return _then(_ImportVocabularyModel(
      lstTableServingProgress: lstTableServingProgress == freezed
          ? _value.lstTableServingProgress
          : lstTableServingProgress // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      selectedCardIndex: selectedCardIndex == freezed
          ? _value.selectedCardIndex
          : selectedCardIndex // ignore: cast_nullable_to_non_nullable
              as int,
      jlptLevel: jlptLevel == freezed
          ? _value.jlptLevel
          : jlptLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImportVocabularyModel implements _ImportVocabularyModel {
  const _$_ImportVocabularyModel(
      {this.lstTableServingProgress = const [],
      this.selectedCardIndex = 1,
      this.jlptLevel = 1});

  factory _$_ImportVocabularyModel.fromJson(Map<String, dynamic> json) =>
      _$$_ImportVocabularyModelFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> lstTableServingProgress;
  @JsonKey(defaultValue: 1)
  @override
  final int selectedCardIndex;
  @JsonKey(defaultValue: 1)
  @override
  final int jlptLevel;

  @override
  String toString() {
    return 'ImportVocabularyModel(lstTableServingProgress: $lstTableServingProgress, selectedCardIndex: $selectedCardIndex, jlptLevel: $jlptLevel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ImportVocabularyModel &&
            (identical(
                    other.lstTableServingProgress, lstTableServingProgress) ||
                const DeepCollectionEquality().equals(
                    other.lstTableServingProgress, lstTableServingProgress)) &&
            (identical(other.selectedCardIndex, selectedCardIndex) ||
                const DeepCollectionEquality()
                    .equals(other.selectedCardIndex, selectedCardIndex)) &&
            (identical(other.jlptLevel, jlptLevel) ||
                const DeepCollectionEquality()
                    .equals(other.jlptLevel, jlptLevel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lstTableServingProgress) ^
      const DeepCollectionEquality().hash(selectedCardIndex) ^
      const DeepCollectionEquality().hash(jlptLevel);

  @JsonKey(ignore: true)
  @override
  _$ImportVocabularyModelCopyWith<_ImportVocabularyModel> get copyWith =>
      __$ImportVocabularyModelCopyWithImpl<_ImportVocabularyModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImportVocabularyModelToJson(this);
  }
}

abstract class _ImportVocabularyModel implements ImportVocabularyModel {
  const factory _ImportVocabularyModel(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      int jlptLevel}) = _$_ImportVocabularyModel;

  factory _ImportVocabularyModel.fromJson(Map<String, dynamic> json) =
      _$_ImportVocabularyModel.fromJson;

  @override
  List<dynamic> get lstTableServingProgress =>
      throw _privateConstructorUsedError;
  @override
  int get selectedCardIndex => throw _privateConstructorUsedError;
  @override
  int get jlptLevel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ImportVocabularyModelCopyWith<_ImportVocabularyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
