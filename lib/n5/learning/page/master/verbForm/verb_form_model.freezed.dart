// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'verb_form_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VerbFormModel _$VerbFormModelFromJson(Map<String, dynamic> json) {
  return _VerbFormModel.fromJson(json);
}

/// @nodoc
class _$VerbFormModelTearOff {
  const _$VerbFormModelTearOff();

  _VerbFormModel call(
      {String title = "",
      int selectedCardIndex = 1,
      bool isTestMode = false,
      String currentVerb = "",
      List<dynamic> lstConjugateResult = const []}) {
    return _VerbFormModel(
      title: title,
      selectedCardIndex: selectedCardIndex,
      isTestMode: isTestMode,
      currentVerb: currentVerb,
      lstConjugateResult: lstConjugateResult,
    );
  }

  VerbFormModel fromJson(Map<String, Object> json) {
    return VerbFormModel.fromJson(json);
  }
}

/// @nodoc
const $VerbFormModel = _$VerbFormModelTearOff();

/// @nodoc
mixin _$VerbFormModel {
  String get title => throw _privateConstructorUsedError;
  int get selectedCardIndex => throw _privateConstructorUsedError;
  bool get isTestMode => throw _privateConstructorUsedError;
  String get currentVerb => throw _privateConstructorUsedError;
  List<dynamic> get lstConjugateResult => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerbFormModelCopyWith<VerbFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerbFormModelCopyWith<$Res> {
  factory $VerbFormModelCopyWith(
          VerbFormModel value, $Res Function(VerbFormModel) then) =
      _$VerbFormModelCopyWithImpl<$Res>;
  $Res call(
      {String title,
      int selectedCardIndex,
      bool isTestMode,
      String currentVerb,
      List<dynamic> lstConjugateResult});
}

/// @nodoc
class _$VerbFormModelCopyWithImpl<$Res>
    implements $VerbFormModelCopyWith<$Res> {
  _$VerbFormModelCopyWithImpl(this._value, this._then);

  final VerbFormModel _value;
  // ignore: unused_field
  final $Res Function(VerbFormModel) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? selectedCardIndex = freezed,
    Object? isTestMode = freezed,
    Object? currentVerb = freezed,
    Object? lstConjugateResult = freezed,
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
      isTestMode: isTestMode == freezed
          ? _value.isTestMode
          : isTestMode // ignore: cast_nullable_to_non_nullable
              as bool,
      currentVerb: currentVerb == freezed
          ? _value.currentVerb
          : currentVerb // ignore: cast_nullable_to_non_nullable
              as String,
      lstConjugateResult: lstConjugateResult == freezed
          ? _value.lstConjugateResult
          : lstConjugateResult // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$VerbFormModelCopyWith<$Res>
    implements $VerbFormModelCopyWith<$Res> {
  factory _$VerbFormModelCopyWith(
          _VerbFormModel value, $Res Function(_VerbFormModel) then) =
      __$VerbFormModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      int selectedCardIndex,
      bool isTestMode,
      String currentVerb,
      List<dynamic> lstConjugateResult});
}

/// @nodoc
class __$VerbFormModelCopyWithImpl<$Res>
    extends _$VerbFormModelCopyWithImpl<$Res>
    implements _$VerbFormModelCopyWith<$Res> {
  __$VerbFormModelCopyWithImpl(
      _VerbFormModel _value, $Res Function(_VerbFormModel) _then)
      : super(_value, (v) => _then(v as _VerbFormModel));

  @override
  _VerbFormModel get _value => super._value as _VerbFormModel;

  @override
  $Res call({
    Object? title = freezed,
    Object? selectedCardIndex = freezed,
    Object? isTestMode = freezed,
    Object? currentVerb = freezed,
    Object? lstConjugateResult = freezed,
  }) {
    return _then(_VerbFormModel(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCardIndex: selectedCardIndex == freezed
          ? _value.selectedCardIndex
          : selectedCardIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isTestMode: isTestMode == freezed
          ? _value.isTestMode
          : isTestMode // ignore: cast_nullable_to_non_nullable
              as bool,
      currentVerb: currentVerb == freezed
          ? _value.currentVerb
          : currentVerb // ignore: cast_nullable_to_non_nullable
              as String,
      lstConjugateResult: lstConjugateResult == freezed
          ? _value.lstConjugateResult
          : lstConjugateResult // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VerbFormModel implements _VerbFormModel {
  const _$_VerbFormModel(
      {this.title = "",
      this.selectedCardIndex = 1,
      this.isTestMode = false,
      this.currentVerb = "",
      this.lstConjugateResult = const []});

  factory _$_VerbFormModel.fromJson(Map<String, dynamic> json) =>
      _$$_VerbFormModelFromJson(json);

  @JsonKey(defaultValue: "")
  @override
  final String title;
  @JsonKey(defaultValue: 1)
  @override
  final int selectedCardIndex;
  @JsonKey(defaultValue: false)
  @override
  final bool isTestMode;
  @JsonKey(defaultValue: "")
  @override
  final String currentVerb;
  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> lstConjugateResult;

  @override
  String toString() {
    return 'VerbFormModel(title: $title, selectedCardIndex: $selectedCardIndex, isTestMode: $isTestMode, currentVerb: $currentVerb, lstConjugateResult: $lstConjugateResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VerbFormModel &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.selectedCardIndex, selectedCardIndex) ||
                const DeepCollectionEquality()
                    .equals(other.selectedCardIndex, selectedCardIndex)) &&
            (identical(other.isTestMode, isTestMode) ||
                const DeepCollectionEquality()
                    .equals(other.isTestMode, isTestMode)) &&
            (identical(other.currentVerb, currentVerb) ||
                const DeepCollectionEquality()
                    .equals(other.currentVerb, currentVerb)) &&
            (identical(other.lstConjugateResult, lstConjugateResult) ||
                const DeepCollectionEquality()
                    .equals(other.lstConjugateResult, lstConjugateResult)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(selectedCardIndex) ^
      const DeepCollectionEquality().hash(isTestMode) ^
      const DeepCollectionEquality().hash(currentVerb) ^
      const DeepCollectionEquality().hash(lstConjugateResult);

  @JsonKey(ignore: true)
  @override
  _$VerbFormModelCopyWith<_VerbFormModel> get copyWith =>
      __$VerbFormModelCopyWithImpl<_VerbFormModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VerbFormModelToJson(this);
  }
}

abstract class _VerbFormModel implements VerbFormModel {
  const factory _VerbFormModel(
      {String title,
      int selectedCardIndex,
      bool isTestMode,
      String currentVerb,
      List<dynamic> lstConjugateResult}) = _$_VerbFormModel;

  factory _VerbFormModel.fromJson(Map<String, dynamic> json) =
      _$_VerbFormModel.fromJson;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  int get selectedCardIndex => throw _privateConstructorUsedError;
  @override
  bool get isTestMode => throw _privateConstructorUsedError;
  @override
  String get currentVerb => throw _privateConstructorUsedError;
  @override
  List<dynamic> get lstConjugateResult => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VerbFormModelCopyWith<_VerbFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}
