// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vocabulary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VocabularyModel _$VocabularyModelFromJson(Map<String, dynamic> json) {
  return _VocabularyModel.fromJson(json);
}

/// @nodoc
class _$VocabularyModelTearOff {
  const _$VocabularyModelTearOff();

  _VocabularyModel call(
      {List<dynamic> lstTableServingProgress = const [],
      int selectedCardIndex = 1,
      int jlptLevel = 1,
      String searchKey = ""}) {
    return _VocabularyModel(
      lstTableServingProgress: lstTableServingProgress,
      selectedCardIndex: selectedCardIndex,
      jlptLevel: jlptLevel,
      searchKey: searchKey,
    );
  }

  VocabularyModel fromJson(Map<String, Object> json) {
    return VocabularyModel.fromJson(json);
  }
}

/// @nodoc
const $VocabularyModel = _$VocabularyModelTearOff();

/// @nodoc
mixin _$VocabularyModel {
  List<dynamic> get lstTableServingProgress =>
      throw _privateConstructorUsedError;
  int get selectedCardIndex => throw _privateConstructorUsedError;
  int get jlptLevel => throw _privateConstructorUsedError;
  String get searchKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VocabularyModelCopyWith<VocabularyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyModelCopyWith<$Res> {
  factory $VocabularyModelCopyWith(
          VocabularyModel value, $Res Function(VocabularyModel) then) =
      _$VocabularyModelCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      int jlptLevel,
      String searchKey});
}

/// @nodoc
class _$VocabularyModelCopyWithImpl<$Res>
    implements $VocabularyModelCopyWith<$Res> {
  _$VocabularyModelCopyWithImpl(this._value, this._then);

  final VocabularyModel _value;
  // ignore: unused_field
  final $Res Function(VocabularyModel) _then;

  @override
  $Res call({
    Object? lstTableServingProgress = freezed,
    Object? selectedCardIndex = freezed,
    Object? jlptLevel = freezed,
    Object? searchKey = freezed,
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
      searchKey: searchKey == freezed
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$VocabularyModelCopyWith<$Res>
    implements $VocabularyModelCopyWith<$Res> {
  factory _$VocabularyModelCopyWith(
          _VocabularyModel value, $Res Function(_VocabularyModel) then) =
      __$VocabularyModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      int jlptLevel,
      String searchKey});
}

/// @nodoc
class __$VocabularyModelCopyWithImpl<$Res>
    extends _$VocabularyModelCopyWithImpl<$Res>
    implements _$VocabularyModelCopyWith<$Res> {
  __$VocabularyModelCopyWithImpl(
      _VocabularyModel _value, $Res Function(_VocabularyModel) _then)
      : super(_value, (v) => _then(v as _VocabularyModel));

  @override
  _VocabularyModel get _value => super._value as _VocabularyModel;

  @override
  $Res call({
    Object? lstTableServingProgress = freezed,
    Object? selectedCardIndex = freezed,
    Object? jlptLevel = freezed,
    Object? searchKey = freezed,
  }) {
    return _then(_VocabularyModel(
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
      searchKey: searchKey == freezed
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VocabularyModel implements _VocabularyModel {
  const _$_VocabularyModel(
      {this.lstTableServingProgress = const [],
      this.selectedCardIndex = 1,
      this.jlptLevel = 1,
      this.searchKey = ""});

  factory _$_VocabularyModel.fromJson(Map<String, dynamic> json) =>
      _$$_VocabularyModelFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> lstTableServingProgress;
  @JsonKey(defaultValue: 1)
  @override
  final int selectedCardIndex;
  @JsonKey(defaultValue: 1)
  @override
  final int jlptLevel;
  @JsonKey(defaultValue: "")
  @override
  final String searchKey;

  @override
  String toString() {
    return 'VocabularyModel(lstTableServingProgress: $lstTableServingProgress, selectedCardIndex: $selectedCardIndex, jlptLevel: $jlptLevel, searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VocabularyModel &&
            (identical(
                    other.lstTableServingProgress, lstTableServingProgress) ||
                const DeepCollectionEquality().equals(
                    other.lstTableServingProgress, lstTableServingProgress)) &&
            (identical(other.selectedCardIndex, selectedCardIndex) ||
                const DeepCollectionEquality()
                    .equals(other.selectedCardIndex, selectedCardIndex)) &&
            (identical(other.jlptLevel, jlptLevel) ||
                const DeepCollectionEquality()
                    .equals(other.jlptLevel, jlptLevel)) &&
            (identical(other.searchKey, searchKey) ||
                const DeepCollectionEquality()
                    .equals(other.searchKey, searchKey)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lstTableServingProgress) ^
      const DeepCollectionEquality().hash(selectedCardIndex) ^
      const DeepCollectionEquality().hash(jlptLevel) ^
      const DeepCollectionEquality().hash(searchKey);

  @JsonKey(ignore: true)
  @override
  _$VocabularyModelCopyWith<_VocabularyModel> get copyWith =>
      __$VocabularyModelCopyWithImpl<_VocabularyModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VocabularyModelToJson(this);
  }
}

abstract class _VocabularyModel implements VocabularyModel {
  const factory _VocabularyModel(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      int jlptLevel,
      String searchKey}) = _$_VocabularyModel;

  factory _VocabularyModel.fromJson(Map<String, dynamic> json) =
      _$_VocabularyModel.fromJson;

  @override
  List<dynamic> get lstTableServingProgress =>
      throw _privateConstructorUsedError;
  @override
  int get selectedCardIndex => throw _privateConstructorUsedError;
  @override
  int get jlptLevel => throw _privateConstructorUsedError;
  @override
  String get searchKey => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VocabularyModelCopyWith<_VocabularyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
