// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'listening_test_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListeningTestState _$ListeningTestStateFromJson(Map<String, dynamic> json) {
  return _ListeningTestState.fromJson(json);
}

/// @nodoc
class _$ListeningTestStateTearOff {
  const _$ListeningTestStateTearOff();

  _ListeningTestState call(
      {List<dynamic> tags = const [], String? selectedId = null}) {
    return _ListeningTestState(
      tags: tags,
      selectedId: selectedId,
    );
  }

  ListeningTestState fromJson(Map<String, Object> json) {
    return ListeningTestState.fromJson(json);
  }
}

/// @nodoc
const $ListeningTestState = _$ListeningTestStateTearOff();

/// @nodoc
mixin _$ListeningTestState {
  List<dynamic> get tags => throw _privateConstructorUsedError;
  String? get selectedId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListeningTestStateCopyWith<ListeningTestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListeningTestStateCopyWith<$Res> {
  factory $ListeningTestStateCopyWith(
          ListeningTestState value, $Res Function(ListeningTestState) then) =
      _$ListeningTestStateCopyWithImpl<$Res>;
  $Res call({List<dynamic> tags, String? selectedId});
}

/// @nodoc
class _$ListeningTestStateCopyWithImpl<$Res>
    implements $ListeningTestStateCopyWith<$Res> {
  _$ListeningTestStateCopyWithImpl(this._value, this._then);

  final ListeningTestState _value;
  // ignore: unused_field
  final $Res Function(ListeningTestState) _then;

  @override
  $Res call({
    Object? tags = freezed,
    Object? selectedId = freezed,
  }) {
    return _then(_value.copyWith(
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      selectedId: selectedId == freezed
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ListeningTestStateCopyWith<$Res>
    implements $ListeningTestStateCopyWith<$Res> {
  factory _$ListeningTestStateCopyWith(
          _ListeningTestState value, $Res Function(_ListeningTestState) then) =
      __$ListeningTestStateCopyWithImpl<$Res>;
  @override
  $Res call({List<dynamic> tags, String? selectedId});
}

/// @nodoc
class __$ListeningTestStateCopyWithImpl<$Res>
    extends _$ListeningTestStateCopyWithImpl<$Res>
    implements _$ListeningTestStateCopyWith<$Res> {
  __$ListeningTestStateCopyWithImpl(
      _ListeningTestState _value, $Res Function(_ListeningTestState) _then)
      : super(_value, (v) => _then(v as _ListeningTestState));

  @override
  _ListeningTestState get _value => super._value as _ListeningTestState;

  @override
  $Res call({
    Object? tags = freezed,
    Object? selectedId = freezed,
  }) {
    return _then(_ListeningTestState(
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      selectedId: selectedId == freezed
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListeningTestState implements _ListeningTestState {
  const _$_ListeningTestState({this.tags = const [], this.selectedId = null});

  factory _$_ListeningTestState.fromJson(Map<String, dynamic> json) =>
      _$$_ListeningTestStateFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<dynamic> tags;
  @JsonKey(defaultValue: null)
  @override
  final String? selectedId;

  @override
  String toString() {
    return 'ListeningTestState(tags: $tags, selectedId: $selectedId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ListeningTestState &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.selectedId, selectedId) ||
                const DeepCollectionEquality()
                    .equals(other.selectedId, selectedId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(selectedId);

  @JsonKey(ignore: true)
  @override
  _$ListeningTestStateCopyWith<_ListeningTestState> get copyWith =>
      __$ListeningTestStateCopyWithImpl<_ListeningTestState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListeningTestStateToJson(this);
  }
}

abstract class _ListeningTestState implements ListeningTestState {
  const factory _ListeningTestState({List<dynamic> tags, String? selectedId}) =
      _$_ListeningTestState;

  factory _ListeningTestState.fromJson(Map<String, dynamic> json) =
      _$_ListeningTestState.fromJson;

  @override
  List<dynamic> get tags => throw _privateConstructorUsedError;
  @override
  String? get selectedId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ListeningTestStateCopyWith<_ListeningTestState> get copyWith =>
      throw _privateConstructorUsedError;
}
