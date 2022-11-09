// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'master_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MasterDataModel _$MasterDataModelFromJson(Map<String, dynamic> json) {
  return _MasterDataModel.fromJson(json);
}

/// @nodoc
class _$MasterDataModelTearOff {
  const _$MasterDataModelTearOff();

  _MasterDataModel call(
      {String title = "",
      int selectedCardIndex = 1,
      List<dynamic> lstWordGroup = const []}) {
    return _MasterDataModel(
      title: title,
      selectedCardIndex: selectedCardIndex,
      lstWordGroup: lstWordGroup,
    );
  }

  MasterDataModel fromJson(Map<String, Object> json) {
    return MasterDataModel.fromJson(json);
  }
}

/// @nodoc
const $MasterDataModel = _$MasterDataModelTearOff();

/// @nodoc
mixin _$MasterDataModel {
  String get title => throw _privateConstructorUsedError;
  int get selectedCardIndex => throw _privateConstructorUsedError;
  List<dynamic> get lstWordGroup => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MasterDataModelCopyWith<MasterDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasterDataModelCopyWith<$Res> {
  factory $MasterDataModelCopyWith(
          MasterDataModel value, $Res Function(MasterDataModel) then) =
      _$MasterDataModelCopyWithImpl<$Res>;
  $Res call({String title, int selectedCardIndex, List<dynamic> lstWordGroup});
}

/// @nodoc
class _$MasterDataModelCopyWithImpl<$Res>
    implements $MasterDataModelCopyWith<$Res> {
  _$MasterDataModelCopyWithImpl(this._value, this._then);

  final MasterDataModel _value;
  // ignore: unused_field
  final $Res Function(MasterDataModel) _then;

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
abstract class _$MasterDataModelCopyWith<$Res>
    implements $MasterDataModelCopyWith<$Res> {
  factory _$MasterDataModelCopyWith(
          _MasterDataModel value, $Res Function(_MasterDataModel) then) =
      __$MasterDataModelCopyWithImpl<$Res>;
  @override
  $Res call({String title, int selectedCardIndex, List<dynamic> lstWordGroup});
}

/// @nodoc
class __$MasterDataModelCopyWithImpl<$Res>
    extends _$MasterDataModelCopyWithImpl<$Res>
    implements _$MasterDataModelCopyWith<$Res> {
  __$MasterDataModelCopyWithImpl(
      _MasterDataModel _value, $Res Function(_MasterDataModel) _then)
      : super(_value, (v) => _then(v as _MasterDataModel));

  @override
  _MasterDataModel get _value => super._value as _MasterDataModel;

  @override
  $Res call({
    Object? title = freezed,
    Object? selectedCardIndex = freezed,
    Object? lstWordGroup = freezed,
  }) {
    return _then(_MasterDataModel(
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
class _$_MasterDataModel implements _MasterDataModel {
  const _$_MasterDataModel(
      {this.title = "",
      this.selectedCardIndex = 1,
      this.lstWordGroup = const []});

  factory _$_MasterDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_MasterDataModelFromJson(json);

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
    return 'MasterDataModel(title: $title, selectedCardIndex: $selectedCardIndex, lstWordGroup: $lstWordGroup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MasterDataModel &&
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
  _$MasterDataModelCopyWith<_MasterDataModel> get copyWith =>
      __$MasterDataModelCopyWithImpl<_MasterDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MasterDataModelToJson(this);
  }
}

abstract class _MasterDataModel implements MasterDataModel {
  const factory _MasterDataModel(
      {String title,
      int selectedCardIndex,
      List<dynamic> lstWordGroup}) = _$_MasterDataModel;

  factory _MasterDataModel.fromJson(Map<String, dynamic> json) =
      _$_MasterDataModel.fromJson;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  int get selectedCardIndex => throw _privateConstructorUsedError;
  @override
  List<dynamic> get lstWordGroup => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MasterDataModelCopyWith<_MasterDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
