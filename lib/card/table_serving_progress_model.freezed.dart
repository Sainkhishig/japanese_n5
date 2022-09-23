// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'table_serving_progress_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TableServingProgressModel _$TableServingProgressModelFromJson(
    Map<String, dynamic> json) {
  return _TableServingProgressModel.fromJson(json);
}

/// @nodoc
class _$TableServingProgressModelTearOff {
  const _$TableServingProgressModelTearOff();

  _TableServingProgressModel call(
      {List<dynamic> lstTableServingProgress = const [],
      int selectedCardIndex = 1,
      int jlptLevel = 1,
      String searchKey = ""}) {
    return _TableServingProgressModel(
      lstTableServingProgress: lstTableServingProgress,
      selectedCardIndex: selectedCardIndex,
      jlptLevel: jlptLevel,
      searchKey: searchKey,
    );
  }

  TableServingProgressModel fromJson(Map<String, Object> json) {
    return TableServingProgressModel.fromJson(json);
  }
}

/// @nodoc
const $TableServingProgressModel = _$TableServingProgressModelTearOff();

/// @nodoc
mixin _$TableServingProgressModel {
  List<dynamic> get lstTableServingProgress =>
      throw _privateConstructorUsedError;
  int get selectedCardIndex => throw _privateConstructorUsedError;
  int get jlptLevel => throw _privateConstructorUsedError;
  String get searchKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TableServingProgressModelCopyWith<TableServingProgressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableServingProgressModelCopyWith<$Res> {
  factory $TableServingProgressModelCopyWith(TableServingProgressModel value,
          $Res Function(TableServingProgressModel) then) =
      _$TableServingProgressModelCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      int jlptLevel,
      String searchKey});
}

/// @nodoc
class _$TableServingProgressModelCopyWithImpl<$Res>
    implements $TableServingProgressModelCopyWith<$Res> {
  _$TableServingProgressModelCopyWithImpl(this._value, this._then);

  final TableServingProgressModel _value;
  // ignore: unused_field
  final $Res Function(TableServingProgressModel) _then;

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
abstract class _$TableServingProgressModelCopyWith<$Res>
    implements $TableServingProgressModelCopyWith<$Res> {
  factory _$TableServingProgressModelCopyWith(_TableServingProgressModel value,
          $Res Function(_TableServingProgressModel) then) =
      __$TableServingProgressModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      int jlptLevel,
      String searchKey});
}

/// @nodoc
class __$TableServingProgressModelCopyWithImpl<$Res>
    extends _$TableServingProgressModelCopyWithImpl<$Res>
    implements _$TableServingProgressModelCopyWith<$Res> {
  __$TableServingProgressModelCopyWithImpl(_TableServingProgressModel _value,
      $Res Function(_TableServingProgressModel) _then)
      : super(_value, (v) => _then(v as _TableServingProgressModel));

  @override
  _TableServingProgressModel get _value =>
      super._value as _TableServingProgressModel;

  @override
  $Res call({
    Object? lstTableServingProgress = freezed,
    Object? selectedCardIndex = freezed,
    Object? jlptLevel = freezed,
    Object? searchKey = freezed,
  }) {
    return _then(_TableServingProgressModel(
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
class _$_TableServingProgressModel implements _TableServingProgressModel {
  const _$_TableServingProgressModel(
      {this.lstTableServingProgress = const [],
      this.selectedCardIndex = 1,
      this.jlptLevel = 1,
      this.searchKey = ""});

  factory _$_TableServingProgressModel.fromJson(Map<String, dynamic> json) =>
      _$$_TableServingProgressModelFromJson(json);

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
    return 'TableServingProgressModel(lstTableServingProgress: $lstTableServingProgress, selectedCardIndex: $selectedCardIndex, jlptLevel: $jlptLevel, searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TableServingProgressModel &&
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
  _$TableServingProgressModelCopyWith<_TableServingProgressModel>
      get copyWith =>
          __$TableServingProgressModelCopyWithImpl<_TableServingProgressModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TableServingProgressModelToJson(this);
  }
}

abstract class _TableServingProgressModel implements TableServingProgressModel {
  const factory _TableServingProgressModel(
      {List<dynamic> lstTableServingProgress,
      int selectedCardIndex,
      int jlptLevel,
      String searchKey}) = _$_TableServingProgressModel;

  factory _TableServingProgressModel.fromJson(Map<String, dynamic> json) =
      _$_TableServingProgressModel.fromJson;

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
  _$TableServingProgressModelCopyWith<_TableServingProgressModel>
      get copyWith => throw _privateConstructorUsedError;
}
