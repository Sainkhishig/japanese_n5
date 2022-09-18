import 'package:freezed_annotation/freezed_annotation.dart';

part 'master_data_model.freezed.dart';
part 'master_data_model.g.dart';

@freezed
abstract class MasterDataModel with _$MasterDataModel {
  const factory MasterDataModel({
    @Default("") String title,
    @Default(1) int selectedCardIndex,
    @Default([]) List<dynamic> lstWordGroup,
  }) = _MasterDataModel;
  factory MasterDataModel.fromJson(Map<String, dynamic> json) =>
      _$MasterDataModelFromJson(json);
}
