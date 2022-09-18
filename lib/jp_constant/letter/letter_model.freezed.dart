// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'letter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LetterModel _$LetterModelFromJson(Map<String, dynamic> json) {
  return _LetterModel.fromJson(json);
}

/// @nodoc
class _$LetterModelTearOff {
  const _$LetterModelTearOff();

  _LetterModel call(
      {String title = "",
      int selectedCardIndex = 0,
      List<dynamic> lstLetter = const [],
      List<dynamic> lstSample = const []}) {
    return _LetterModel(
      title: title,
      selectedCardIndex: selectedCardIndex,
      lstLetter: lstLetter,
      lstSample: lstSample,
    );
  }

  LetterModel fromJson(Map<String, Object> json) {
    return LetterModel.fromJson(json);
  }
}

/// @nodoc
const $LetterModel = _$LetterModelTearOff();

/// @nodoc
mixin _$LetterModel {
  String get title => throw _privateConstructorUsedError;
  int get selectedCardIndex => throw _privateConstructorUsedError;
  List<dynamic> get lstLetter => throw _privateConstructorUsedError;
  List<dynamic> get lstSample => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LetterModelCopyWith<LetterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LetterModelCopyWith<$Res> {
  factory $LetterModelCopyWith(
          LetterModel value, $Res Function(LetterModel) then) =
      _$LetterModelCopyWithImpl<$Res>;
  $Res call(
      {String title,
      int selectedCardIndex,
      List<dynamic> lstLetter,
      List<dynamic> lstSample});
}

/// @nodoc
class _$LetterModelCopyWithImpl<$Res> implements $LetterModelCopyWith<$Res> {
  _$LetterModelCopyWithImpl(this._value, this._then);

  final LetterModel _value;
  // ignore: unused_field
  final $Res Function(LetterModel) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? selectedCardIndex = freezed,
    Object? lstLetter = freezed,
    Object? lstSample = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCardIndex: selectedCardIndex == freezed
          ? _value.selectedCardIndex
          : selectedCardIndex // ignore: cast_nullable_to_non_nullable
              as int,
      lstLetter: lstLetter == freezed
          ? _value.lstLetter
          : lstLetter // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      lstSample: lstSample == freezed
          ? _value.lstSample
          : lstSample // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$LetterModelCopyWith<$Res>
    implements $LetterModelCopyWith<$Res> {
  factory _$LetterModelCopyWith(
          _LetterModel value, $Res Function(_LetterModel) then) =
      __$LetterModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      int selectedCardIndex,
      List<dynamic> lstLetter,
      List<dynamic> lstSample});
}

/// @nodoc
class __$LetterModelCopyWithImpl<$Res> extends _$LetterModelCopyWithImpl<$Res>
    implements _$LetterModelCopyWith<$Res> {
  __$LetterModelCopyWithImpl(
      _LetterModel _value, $Res Function(_LetterModel) _then)
      : super(_value, (v) => _then(v as _LetterModel));

  @override
  _LetterModel get _value => super._value as _LetterModel;

  @override
  $Res call({
    Object? title = freezed,
    Object? selectedCardIndex = freezed,
    Object? lstLetter = freezed,
    Object? lstSample = freezed,
  }) {
    return _then(_LetterModel(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCardIndex: selectedCardIndex == freezed
          ? _value.selectedCardIndex
          : selectedCardIndex // ignore: cast_nullable_to_non_nullable
              as int,
      lstLetter: lstLetter == freezed
          ? _value.lstLetter
          : lstLetter // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      lstSample: lstSample == freezed
          ? _value.lstSample
          : lstSample // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LetterModel implements _LetterModel {
  const _$_LetterModel(
      {this.title = "",
      this.selectedCardIndex = 0,
      this.lstLetter = const [],
      this.lstSample = const []});

  factory _$_LetterModel.fromJson(Map<String, dynamic> json) =>
      _$$_LetterModelFromJson(json);

  @JsonKey(defaultValue: "")
  @override
  final String title;
  @JsonKey(defaultValue: 0)
  @override
  final int selectedCardIndex;
  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> lstLetter;
  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> lstSample;

  @override
  String toString() {
    return 'LetterModel(title: $title, selectedCardIndex: $selectedCardIndex, lstLetter: $lstLetter, lstSample: $lstSample)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LetterModel &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.selectedCardIndex, selectedCardIndex) ||
                const DeepCollectionEquality()
                    .equals(other.selectedCardIndex, selectedCardIndex)) &&
            (identical(other.lstLetter, lstLetter) ||
                const DeepCollectionEquality()
                    .equals(other.lstLetter, lstLetter)) &&
            (identical(other.lstSample, lstSample) ||
                const DeepCollectionEquality()
                    .equals(other.lstSample, lstSample)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(selectedCardIndex) ^
      const DeepCollectionEquality().hash(lstLetter) ^
      const DeepCollectionEquality().hash(lstSample);

  @JsonKey(ignore: true)
  @override
  _$LetterModelCopyWith<_LetterModel> get copyWith =>
      __$LetterModelCopyWithImpl<_LetterModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LetterModelToJson(this);
  }
}

abstract class _LetterModel implements LetterModel {
  const factory _LetterModel(
      {String title,
      int selectedCardIndex,
      List<dynamic> lstLetter,
      List<dynamic> lstSample}) = _$_LetterModel;

  factory _LetterModel.fromJson(Map<String, dynamic> json) =
      _$_LetterModel.fromJson;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  int get selectedCardIndex => throw _privateConstructorUsedError;
  @override
  List<dynamic> get lstLetter => throw _privateConstructorUsedError;
  @override
  List<dynamic> get lstSample => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LetterModelCopyWith<_LetterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
