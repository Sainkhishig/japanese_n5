// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'kanji_test_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KanjiTestState _$KanjiTestStateFromJson(Map<String, dynamic> json) {
  return _KanjiTestState.fromJson(json);
}

/// @nodoc
class _$KanjiTestStateTearOff {
  const _$KanjiTestStateTearOff();

  _KanjiTestState call(
      {List<dynamic> tags = const [],
      List<dynamic> kanjiTestSource = const [],
      String? selectedId = null,
      dynamic selectedKanjiTest = null}) {
    return _KanjiTestState(
      tags: tags,
      kanjiTestSource: kanjiTestSource,
      selectedId: selectedId,
      selectedKanjiTest: selectedKanjiTest,
    );
  }

  KanjiTestState fromJson(Map<String, Object> json) {
    return KanjiTestState.fromJson(json);
  }
}

/// @nodoc
const $KanjiTestState = _$KanjiTestStateTearOff();

/// @nodoc
mixin _$KanjiTestState {
  List<dynamic> get tags => throw _privateConstructorUsedError;
  List<dynamic> get kanjiTestSource => throw _privateConstructorUsedError;
  String? get selectedId => throw _privateConstructorUsedError;
  dynamic get selectedKanjiTest => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KanjiTestStateCopyWith<KanjiTestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KanjiTestStateCopyWith<$Res> {
  factory $KanjiTestStateCopyWith(
          KanjiTestState value, $Res Function(KanjiTestState) then) =
      _$KanjiTestStateCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic> tags,
      List<dynamic> kanjiTestSource,
      String? selectedId,
      dynamic selectedKanjiTest});
}

/// @nodoc
class _$KanjiTestStateCopyWithImpl<$Res>
    implements $KanjiTestStateCopyWith<$Res> {
  _$KanjiTestStateCopyWithImpl(this._value, this._then);

  final KanjiTestState _value;
  // ignore: unused_field
  final $Res Function(KanjiTestState) _then;

  @override
  $Res call({
    Object? tags = freezed,
    Object? kanjiTestSource = freezed,
    Object? selectedId = freezed,
    Object? selectedKanjiTest = freezed,
  }) {
    return _then(_value.copyWith(
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      kanjiTestSource: kanjiTestSource == freezed
          ? _value.kanjiTestSource
          : kanjiTestSource // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      selectedId: selectedId == freezed
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedKanjiTest: selectedKanjiTest == freezed
          ? _value.selectedKanjiTest
          : selectedKanjiTest // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$KanjiTestStateCopyWith<$Res>
    implements $KanjiTestStateCopyWith<$Res> {
  factory _$KanjiTestStateCopyWith(
          _KanjiTestState value, $Res Function(_KanjiTestState) then) =
      __$KanjiTestStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic> tags,
      List<dynamic> kanjiTestSource,
      String? selectedId,
      dynamic selectedKanjiTest});
}

/// @nodoc
class __$KanjiTestStateCopyWithImpl<$Res>
    extends _$KanjiTestStateCopyWithImpl<$Res>
    implements _$KanjiTestStateCopyWith<$Res> {
  __$KanjiTestStateCopyWithImpl(
      _KanjiTestState _value, $Res Function(_KanjiTestState) _then)
      : super(_value, (v) => _then(v as _KanjiTestState));

  @override
  _KanjiTestState get _value => super._value as _KanjiTestState;

  @override
  $Res call({
    Object? tags = freezed,
    Object? kanjiTestSource = freezed,
    Object? selectedId = freezed,
    Object? selectedKanjiTest = freezed,
  }) {
    return _then(_KanjiTestState(
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      kanjiTestSource: kanjiTestSource == freezed
          ? _value.kanjiTestSource
          : kanjiTestSource // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      selectedId: selectedId == freezed
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedKanjiTest: selectedKanjiTest == freezed
          ? _value.selectedKanjiTest
          : selectedKanjiTest // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KanjiTestState implements _KanjiTestState {
  const _$_KanjiTestState(
      {this.tags = const [],
      this.kanjiTestSource = const [],
      this.selectedId = null,
      this.selectedKanjiTest = null});

  factory _$_KanjiTestState.fromJson(Map<String, dynamic> json) =>
      _$$_KanjiTestStateFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> tags;
  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> kanjiTestSource;
  @JsonKey(defaultValue: null)
  @override
  final String? selectedId;
  @JsonKey(defaultValue: null)
  @override
  final dynamic selectedKanjiTest;

  @override
  String toString() {
    return 'KanjiTestState(tags: $tags, kanjiTestSource: $kanjiTestSource, selectedId: $selectedId, selectedKanjiTest: $selectedKanjiTest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _KanjiTestState &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.kanjiTestSource, kanjiTestSource) ||
                const DeepCollectionEquality()
                    .equals(other.kanjiTestSource, kanjiTestSource)) &&
            (identical(other.selectedId, selectedId) ||
                const DeepCollectionEquality()
                    .equals(other.selectedId, selectedId)) &&
            (identical(other.selectedKanjiTest, selectedKanjiTest) ||
                const DeepCollectionEquality()
                    .equals(other.selectedKanjiTest, selectedKanjiTest)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(kanjiTestSource) ^
      const DeepCollectionEquality().hash(selectedId) ^
      const DeepCollectionEquality().hash(selectedKanjiTest);

  @JsonKey(ignore: true)
  @override
  _$KanjiTestStateCopyWith<_KanjiTestState> get copyWith =>
      __$KanjiTestStateCopyWithImpl<_KanjiTestState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KanjiTestStateToJson(this);
  }
}

abstract class _KanjiTestState implements KanjiTestState {
  const factory _KanjiTestState(
      {List<dynamic> tags,
      List<dynamic> kanjiTestSource,
      String? selectedId,
      dynamic selectedKanjiTest}) = _$_KanjiTestState;

  factory _KanjiTestState.fromJson(Map<String, dynamic> json) =
      _$_KanjiTestState.fromJson;

  @override
  List<dynamic> get tags => throw _privateConstructorUsedError;
  @override
  List<dynamic> get kanjiTestSource => throw _privateConstructorUsedError;
  @override
  String? get selectedId => throw _privateConstructorUsedError;
  @override
  dynamic get selectedKanjiTest => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$KanjiTestStateCopyWith<_KanjiTestState> get copyWith =>
      throw _privateConstructorUsedError;
}
