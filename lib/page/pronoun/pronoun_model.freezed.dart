// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pronoun_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PronounModel _$PronounModelFromJson(Map<String, dynamic> json) {
  return _PronounModel.fromJson(json);
}

/// @nodoc
class _$PronounModelTearOff {
  const _$PronounModelTearOff();

  _PronounModel call(
      {String title = "",
      int selectedCardIndex = 1,
      List<dynamic> lstLetter = const [],
      List<dynamic> lstSample = const []}) {
    return _PronounModel(
      title: title,
      selectedCardIndex: selectedCardIndex,
      lstLetter: lstLetter,
      lstSample: lstSample,
    );
  }

  PronounModel fromJson(Map<String, Object> json) {
    return PronounModel.fromJson(json);
  }
}

/// @nodoc
const $PronounModel = _$PronounModelTearOff();

/// @nodoc
mixin _$PronounModel {
  String get title => throw _privateConstructorUsedError;
  int get selectedCardIndex => throw _privateConstructorUsedError;
  List<dynamic> get lstLetter => throw _privateConstructorUsedError;
  List<dynamic> get lstSample => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PronounModelCopyWith<PronounModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PronounModelCopyWith<$Res> {
  factory $PronounModelCopyWith(
          PronounModel value, $Res Function(PronounModel) then) =
      _$PronounModelCopyWithImpl<$Res>;
  $Res call(
      {String title,
      int selectedCardIndex,
      List<dynamic> lstLetter,
      List<dynamic> lstSample});
}

/// @nodoc
class _$PronounModelCopyWithImpl<$Res> implements $PronounModelCopyWith<$Res> {
  _$PronounModelCopyWithImpl(this._value, this._then);

  final PronounModel _value;
  // ignore: unused_field
  final $Res Function(PronounModel) _then;

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
abstract class _$PronounModelCopyWith<$Res>
    implements $PronounModelCopyWith<$Res> {
  factory _$PronounModelCopyWith(
          _PronounModel value, $Res Function(_PronounModel) then) =
      __$PronounModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      int selectedCardIndex,
      List<dynamic> lstLetter,
      List<dynamic> lstSample});
}

/// @nodoc
class __$PronounModelCopyWithImpl<$Res> extends _$PronounModelCopyWithImpl<$Res>
    implements _$PronounModelCopyWith<$Res> {
  __$PronounModelCopyWithImpl(
      _PronounModel _value, $Res Function(_PronounModel) _then)
      : super(_value, (v) => _then(v as _PronounModel));

  @override
  _PronounModel get _value => super._value as _PronounModel;

  @override
  $Res call({
    Object? title = freezed,
    Object? selectedCardIndex = freezed,
    Object? lstLetter = freezed,
    Object? lstSample = freezed,
  }) {
    return _then(_PronounModel(
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
class _$_PronounModel implements _PronounModel {
  const _$_PronounModel(
      {this.title = "",
      this.selectedCardIndex = 1,
      this.lstLetter = const [],
      this.lstSample = const []});

  factory _$_PronounModel.fromJson(Map<String, dynamic> json) =>
      _$$_PronounModelFromJson(json);

  @JsonKey(defaultValue: "")
  @override
  final String title;
  @JsonKey(defaultValue: 1)
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
    return 'PronounModel(title: $title, selectedCardIndex: $selectedCardIndex, lstLetter: $lstLetter, lstSample: $lstSample)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PronounModel &&
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
  _$PronounModelCopyWith<_PronounModel> get copyWith =>
      __$PronounModelCopyWithImpl<_PronounModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PronounModelToJson(this);
  }
}

abstract class _PronounModel implements PronounModel {
  const factory _PronounModel(
      {String title,
      int selectedCardIndex,
      List<dynamic> lstLetter,
      List<dynamic> lstSample}) = _$_PronounModel;

  factory _PronounModel.fromJson(Map<String, dynamic> json) =
      _$_PronounModel.fromJson;

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
  _$PronounModelCopyWith<_PronounModel> get copyWith =>
      throw _privateConstructorUsedError;
}
