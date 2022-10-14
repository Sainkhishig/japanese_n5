// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'counter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CounterModel _$CounterModelFromJson(Map<String, dynamic> json) {
  return _CounterModel.fromJson(json);
}

/// @nodoc
class _$CounterModelTearOff {
  const _$CounterModelTearOff();

  _CounterModel call(
      {String title = "",
      int selectedCardIndex = 1,
      List<dynamic> lstWordGroup = const []}) {
    return _CounterModel(
      title: title,
      selectedCardIndex: selectedCardIndex,
      lstWordGroup: lstWordGroup,
    );
  }

  CounterModel fromJson(Map<String, Object> json) {
    return CounterModel.fromJson(json);
  }
}

/// @nodoc
const $CounterModel = _$CounterModelTearOff();

/// @nodoc
mixin _$CounterModel {
  String get title => throw _privateConstructorUsedError;
  int get selectedCardIndex => throw _privateConstructorUsedError;
  List<dynamic> get lstWordGroup => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CounterModelCopyWith<CounterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterModelCopyWith<$Res> {
  factory $CounterModelCopyWith(
          CounterModel value, $Res Function(CounterModel) then) =
      _$CounterModelCopyWithImpl<$Res>;
  $Res call({String title, int selectedCardIndex, List<dynamic> lstWordGroup});
}

/// @nodoc
class _$CounterModelCopyWithImpl<$Res> implements $CounterModelCopyWith<$Res> {
  _$CounterModelCopyWithImpl(this._value, this._then);

  final CounterModel _value;
  // ignore: unused_field
  final $Res Function(CounterModel) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? selectedCardIndex = freezed,
    Object? lstWordGroup = freezed,
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
      lstWordGroup: lstWordGroup == freezed
          ? _value.lstWordGroup
          : lstWordGroup // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$CounterModelCopyWith<$Res>
    implements $CounterModelCopyWith<$Res> {
  factory _$CounterModelCopyWith(
          _CounterModel value, $Res Function(_CounterModel) then) =
      __$CounterModelCopyWithImpl<$Res>;
  @override
  $Res call({String title, int selectedCardIndex, List<dynamic> lstWordGroup});
}

/// @nodoc
class __$CounterModelCopyWithImpl<$Res> extends _$CounterModelCopyWithImpl<$Res>
    implements _$CounterModelCopyWith<$Res> {
  __$CounterModelCopyWithImpl(
      _CounterModel _value, $Res Function(_CounterModel) _then)
      : super(_value, (v) => _then(v as _CounterModel));

  @override
  _CounterModel get _value => super._value as _CounterModel;

  @override
  $Res call({
    Object? title = freezed,
    Object? selectedCardIndex = freezed,
    Object? lstWordGroup = freezed,
  }) {
    return _then(_CounterModel(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCardIndex: selectedCardIndex == freezed
          ? _value.selectedCardIndex
          : selectedCardIndex // ignore: cast_nullable_to_non_nullable
              as int,
      lstWordGroup: lstWordGroup == freezed
          ? _value.lstWordGroup
          : lstWordGroup // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CounterModel implements _CounterModel {
  const _$_CounterModel(
      {this.title = "",
      this.selectedCardIndex = 1,
      this.lstWordGroup = const []});

  factory _$_CounterModel.fromJson(Map<String, dynamic> json) =>
      _$$_CounterModelFromJson(json);

  @JsonKey(defaultValue: "")
  @override
  final String title;
  @JsonKey(defaultValue: 1)
  @override
  final int selectedCardIndex;
  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> lstWordGroup;

  @override
  String toString() {
    return 'CounterModel(title: $title, selectedCardIndex: $selectedCardIndex, lstWordGroup: $lstWordGroup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CounterModel &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.selectedCardIndex, selectedCardIndex) ||
                const DeepCollectionEquality()
                    .equals(other.selectedCardIndex, selectedCardIndex)) &&
            (identical(other.lstWordGroup, lstWordGroup) ||
                const DeepCollectionEquality()
                    .equals(other.lstWordGroup, lstWordGroup)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(selectedCardIndex) ^
      const DeepCollectionEquality().hash(lstWordGroup);

  @JsonKey(ignore: true)
  @override
  _$CounterModelCopyWith<_CounterModel> get copyWith =>
      __$CounterModelCopyWithImpl<_CounterModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CounterModelToJson(this);
  }
}

abstract class _CounterModel implements CounterModel {
  const factory _CounterModel(
      {String title,
      int selectedCardIndex,
      List<dynamic> lstWordGroup}) = _$_CounterModel;

  factory _CounterModel.fromJson(Map<String, dynamic> json) =
      _$_CounterModel.fromJson;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  int get selectedCardIndex => throw _privateConstructorUsedError;
  @override
  List<dynamic> get lstWordGroup => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CounterModelCopyWith<_CounterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
