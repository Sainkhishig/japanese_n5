// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reading_test_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReadingTestState _$ReadingTestStateFromJson(Map<String, dynamic> json) {
  return _ReadingTestState.fromJson(json);
}

/// @nodoc
class _$ReadingTestStateTearOff {
  const _$ReadingTestStateTearOff();

  _ReadingTestState call(
      {List<dynamic> tags = const [],
      List<dynamic> readingTestSource = const [],
      String? selectedId = null,
      dynamic selectedReadingTest = null}) {
    return _ReadingTestState(
      tags: tags,
      readingTestSource: readingTestSource,
      selectedId: selectedId,
      selectedReadingTest: selectedReadingTest,
    );
  }

  ReadingTestState fromJson(Map<String, Object> json) {
    return ReadingTestState.fromJson(json);
  }
}

/// @nodoc
const $ReadingTestState = _$ReadingTestStateTearOff();

/// @nodoc
mixin _$ReadingTestState {
  List<dynamic> get tags => throw _privateConstructorUsedError;
  List<dynamic> get readingTestSource => throw _privateConstructorUsedError;
  String? get selectedId => throw _privateConstructorUsedError;
  dynamic get selectedReadingTest => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReadingTestStateCopyWith<ReadingTestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingTestStateCopyWith<$Res> {
  factory $ReadingTestStateCopyWith(
          ReadingTestState value, $Res Function(ReadingTestState) then) =
      _$ReadingTestStateCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic> tags,
      List<dynamic> readingTestSource,
      String? selectedId,
      dynamic selectedReadingTest});
}

/// @nodoc
class _$ReadingTestStateCopyWithImpl<$Res>
    implements $ReadingTestStateCopyWith<$Res> {
  _$ReadingTestStateCopyWithImpl(this._value, this._then);

  final ReadingTestState _value;
  // ignore: unused_field
  final $Res Function(ReadingTestState) _then;

  @override
  $Res call({
    Object? tags = freezed,
    Object? readingTestSource = freezed,
    Object? selectedId = freezed,
    Object? selectedReadingTest = freezed,
  }) {
    return _then(_value.copyWith(
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      readingTestSource: readingTestSource == freezed
          ? _value.readingTestSource
          : readingTestSource // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      selectedId: selectedId == freezed
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedReadingTest: selectedReadingTest == freezed
          ? _value.selectedReadingTest
          : selectedReadingTest // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$ReadingTestStateCopyWith<$Res>
    implements $ReadingTestStateCopyWith<$Res> {
  factory _$ReadingTestStateCopyWith(
          _ReadingTestState value, $Res Function(_ReadingTestState) then) =
      __$ReadingTestStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic> tags,
      List<dynamic> readingTestSource,
      String? selectedId,
      dynamic selectedReadingTest});
}

/// @nodoc
class __$ReadingTestStateCopyWithImpl<$Res>
    extends _$ReadingTestStateCopyWithImpl<$Res>
    implements _$ReadingTestStateCopyWith<$Res> {
  __$ReadingTestStateCopyWithImpl(
      _ReadingTestState _value, $Res Function(_ReadingTestState) _then)
      : super(_value, (v) => _then(v as _ReadingTestState));

  @override
  _ReadingTestState get _value => super._value as _ReadingTestState;

  @override
  $Res call({
    Object? tags = freezed,
    Object? readingTestSource = freezed,
    Object? selectedId = freezed,
    Object? selectedReadingTest = freezed,
  }) {
    return _then(_ReadingTestState(
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      readingTestSource: readingTestSource == freezed
          ? _value.readingTestSource
          : readingTestSource // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      selectedId: selectedId == freezed
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedReadingTest: selectedReadingTest == freezed
          ? _value.selectedReadingTest
          : selectedReadingTest // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReadingTestState implements _ReadingTestState {
  const _$_ReadingTestState(
      {this.tags = const [],
      this.readingTestSource = const [],
      this.selectedId = null,
      this.selectedReadingTest = null});

  factory _$_ReadingTestState.fromJson(Map<String, dynamic> json) =>
      _$$_ReadingTestStateFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> tags;
  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> readingTestSource;
  @JsonKey(defaultValue: null)
  @override
  final String? selectedId;
  @JsonKey(defaultValue: null)
  @override
  final dynamic selectedReadingTest;

  @override
  String toString() {
    return 'ReadingTestState(tags: $tags, readingTestSource: $readingTestSource, selectedId: $selectedId, selectedReadingTest: $selectedReadingTest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReadingTestState &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.readingTestSource, readingTestSource) ||
                const DeepCollectionEquality()
                    .equals(other.readingTestSource, readingTestSource)) &&
            (identical(other.selectedId, selectedId) ||
                const DeepCollectionEquality()
                    .equals(other.selectedId, selectedId)) &&
            (identical(other.selectedReadingTest, selectedReadingTest) ||
                const DeepCollectionEquality()
                    .equals(other.selectedReadingTest, selectedReadingTest)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(readingTestSource) ^
      const DeepCollectionEquality().hash(selectedId) ^
      const DeepCollectionEquality().hash(selectedReadingTest);

  @JsonKey(ignore: true)
  @override
  _$ReadingTestStateCopyWith<_ReadingTestState> get copyWith =>
      __$ReadingTestStateCopyWithImpl<_ReadingTestState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReadingTestStateToJson(this);
  }
}

abstract class _ReadingTestState implements ReadingTestState {
  const factory _ReadingTestState(
      {List<dynamic> tags,
      List<dynamic> readingTestSource,
      String? selectedId,
      dynamic selectedReadingTest}) = _$_ReadingTestState;

  factory _ReadingTestState.fromJson(Map<String, dynamic> json) =
      _$_ReadingTestState.fromJson;

  @override
  List<dynamic> get tags => throw _privateConstructorUsedError;
  @override
  List<dynamic> get readingTestSource => throw _privateConstructorUsedError;
  @override
  String? get selectedId => throw _privateConstructorUsedError;
  @override
  dynamic get selectedReadingTest => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ReadingTestStateCopyWith<_ReadingTestState> get copyWith =>
      throw _privateConstructorUsedError;
}
