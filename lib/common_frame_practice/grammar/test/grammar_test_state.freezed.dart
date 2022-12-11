// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'grammar_test_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GrammarTestState _$GrammarTestStateFromJson(Map<String, dynamic> json) {
  return _GrammarTestState.fromJson(json);
}

/// @nodoc
class _$GrammarTestStateTearOff {
  const _$GrammarTestStateTearOff();

  _GrammarTestState call(
      {List<dynamic> tags = const [],
      List<dynamic> grammarTestSource = const [],
      String? selectedId = null,
      int selectedTestIndex = 0}) {
    return _GrammarTestState(
      tags: tags,
      grammarTestSource: grammarTestSource,
      selectedId: selectedId,
      selectedTestIndex: selectedTestIndex,
    );
  }

  GrammarTestState fromJson(Map<String, Object> json) {
    return GrammarTestState.fromJson(json);
  }
}

/// @nodoc
const $GrammarTestState = _$GrammarTestStateTearOff();

/// @nodoc
mixin _$GrammarTestState {
  List<dynamic> get tags => throw _privateConstructorUsedError;
  List<dynamic> get grammarTestSource => throw _privateConstructorUsedError;
  String? get selectedId => throw _privateConstructorUsedError;
  int get selectedTestIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GrammarTestStateCopyWith<GrammarTestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrammarTestStateCopyWith<$Res> {
  factory $GrammarTestStateCopyWith(
          GrammarTestState value, $Res Function(GrammarTestState) then) =
      _$GrammarTestStateCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic> tags,
      List<dynamic> grammarTestSource,
      String? selectedId,
      int selectedTestIndex});
}

/// @nodoc
class _$GrammarTestStateCopyWithImpl<$Res>
    implements $GrammarTestStateCopyWith<$Res> {
  _$GrammarTestStateCopyWithImpl(this._value, this._then);

  final GrammarTestState _value;
  // ignore: unused_field
  final $Res Function(GrammarTestState) _then;

  @override
  $Res call({
    Object? tags = freezed,
    Object? grammarTestSource = freezed,
    Object? selectedId = freezed,
    Object? selectedTestIndex = freezed,
  }) {
    return _then(_value.copyWith(
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      grammarTestSource: grammarTestSource == freezed
          ? _value.grammarTestSource
          : grammarTestSource // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      selectedId: selectedId == freezed
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedTestIndex: selectedTestIndex == freezed
          ? _value.selectedTestIndex
          : selectedTestIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$GrammarTestStateCopyWith<$Res>
    implements $GrammarTestStateCopyWith<$Res> {
  factory _$GrammarTestStateCopyWith(
          _GrammarTestState value, $Res Function(_GrammarTestState) then) =
      __$GrammarTestStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic> tags,
      List<dynamic> grammarTestSource,
      String? selectedId,
      int selectedTestIndex});
}

/// @nodoc
class __$GrammarTestStateCopyWithImpl<$Res>
    extends _$GrammarTestStateCopyWithImpl<$Res>
    implements _$GrammarTestStateCopyWith<$Res> {
  __$GrammarTestStateCopyWithImpl(
      _GrammarTestState _value, $Res Function(_GrammarTestState) _then)
      : super(_value, (v) => _then(v as _GrammarTestState));

  @override
  _GrammarTestState get _value => super._value as _GrammarTestState;

  @override
  $Res call({
    Object? tags = freezed,
    Object? grammarTestSource = freezed,
    Object? selectedId = freezed,
    Object? selectedTestIndex = freezed,
  }) {
    return _then(_GrammarTestState(
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      grammarTestSource: grammarTestSource == freezed
          ? _value.grammarTestSource
          : grammarTestSource // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      selectedId: selectedId == freezed
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedTestIndex: selectedTestIndex == freezed
          ? _value.selectedTestIndex
          : selectedTestIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GrammarTestState implements _GrammarTestState {
  const _$_GrammarTestState(
      {this.tags = const [],
      this.grammarTestSource = const [],
      this.selectedId = null,
      this.selectedTestIndex = 0});

  factory _$_GrammarTestState.fromJson(Map<String, dynamic> json) =>
      _$$_GrammarTestStateFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> tags;
  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> grammarTestSource;
  @JsonKey(defaultValue: null)
  @override
  final String? selectedId;
  @JsonKey(defaultValue: 0)
  @override
  final int selectedTestIndex;

  @override
  String toString() {
    return 'GrammarTestState(tags: $tags, grammarTestSource: $grammarTestSource, selectedId: $selectedId, selectedTestIndex: $selectedTestIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GrammarTestState &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.grammarTestSource, grammarTestSource) ||
                const DeepCollectionEquality()
                    .equals(other.grammarTestSource, grammarTestSource)) &&
            (identical(other.selectedId, selectedId) ||
                const DeepCollectionEquality()
                    .equals(other.selectedId, selectedId)) &&
            (identical(other.selectedTestIndex, selectedTestIndex) ||
                const DeepCollectionEquality()
                    .equals(other.selectedTestIndex, selectedTestIndex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(grammarTestSource) ^
      const DeepCollectionEquality().hash(selectedId) ^
      const DeepCollectionEquality().hash(selectedTestIndex);

  @JsonKey(ignore: true)
  @override
  _$GrammarTestStateCopyWith<_GrammarTestState> get copyWith =>
      __$GrammarTestStateCopyWithImpl<_GrammarTestState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GrammarTestStateToJson(this);
  }
}

abstract class _GrammarTestState implements GrammarTestState {
  const factory _GrammarTestState(
      {List<dynamic> tags,
      List<dynamic> grammarTestSource,
      String? selectedId,
      int selectedTestIndex}) = _$_GrammarTestState;

  factory _GrammarTestState.fromJson(Map<String, dynamic> json) =
      _$_GrammarTestState.fromJson;

  @override
  List<dynamic> get tags => throw _privateConstructorUsedError;
  @override
  List<dynamic> get grammarTestSource => throw _privateConstructorUsedError;
  @override
  String? get selectedId => throw _privateConstructorUsedError;
  @override
  int get selectedTestIndex => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GrammarTestStateCopyWith<_GrammarTestState> get copyWith =>
      throw _privateConstructorUsedError;
}
