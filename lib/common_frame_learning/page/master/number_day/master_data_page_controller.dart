import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:state_notifier/state_notifier.dart';

import 'master_data_model.dart';

final letterCardProvider =
    StateNotifierProvider<MasterDataPageController, MasterDataModel>((ref) {
  return MasterDataPageController(widgetRef: ref);
});

class MasterDataPageController extends StateNotifier<MasterDataModel> {
  MasterDataPageController({required this.widgetRef})
      : super(const MasterDataModel());

  final StateNotifierProviderRef widgetRef;
  @override
  MasterDataModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(letterCardProvider);
  }

  // void setLevel(int level) {
  //   state = state.copyWith(jlptLevel: level);
  // }

  setTableServingLocation(int selectedPlaceId) async {
    // var preferences = widgetRef.read(sharedPreferencesProvider);
    // await preferences.setInt("tableServingLocation", selectedPlaceId);
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedCardIndex: index + 1);
  }

  Future<List> getTableAllocationByDate(selectedLocation) async {
    // setTableServingLocation(selectedLocation);
    // final mealTypeState = widgetRef.read(mealTypeRepository);
    // // NOTE: APIが翌日の朝食、昼食の配膳状況を返す仕様のため、リクエスト時に前日を設定
    // //       夕食時は当日のままでOK
    // final formattedDate = widgetRef.read(loginDatetimeProvider).subtract(
    //     Duration(days: (mealTypeState.selectedMealType!.id != 1) ? 1 : 0));
    // final apiProvider = widgetRef.read(orderMenuApiProvider);
    // var listResponse;

    // final responseApi = await apiProvider.getTableAllocationByDate(
    //     DateFormat('yyyy-MM-dd').format(formattedDate),
    //     mealTypeState.selectedMealType!.id,
    //     selectedLocation);

    // if (responseApi.statusCode == 200) {
    //   listResponse = jsonDecode(utf8.decode(responseApi.bodyBytes));
    // } else {
    //   state = state.copyWith(lstTableServingProgress: []);
    //   return [];
    // }

    // List<dynamic> list = listResponse["list"].map((e) {
    //   int adult = e['adult'] ?? 0;
    //   int child = e['child'] ?? 0;
    //   int infantMeal = e['infant'] ?? 0;
    //   int infantNone = 0; //fix me
    //   int total = adult + child + infantMeal + infantNone;
    //   e['childA'] = e['childA'] ?? 0;
    //   e['tableName'] = e['tableName'] ?? "";
    //   e['dinnerTime'] = e['dinnerTime'] ?? "";
    //   e['childB'] = e['childB'] ?? 0;
    //   e['infantA'] = e['infantA'] ?? 0;
    //   e['infantB'] = e['infantB'] ?? 0;
    //   e['infantC'] = e['infantC'] ?? 0;
    //   e['infantD'] = e['infantD'] ?? 0;
    //   e['menuName'] = e['menuName'] ?? '';
    //   e['total'] = total;
    //   e['adult'] = adult;
    //   e['child'] = child;
    //   e['infantMeal'] = infantMeal;
    //   e['infantNone'] = infantNone;
    //   e['remark1'] = e['remark1'] ?? '';
    //   e['remark2'] = e['remark2'] ?? '';
    //   var courseList = e['courseItemList'] as List<dynamic>;
    //   var courseListFormatter = courseList.map((a) {
    //     a['categoryName'] = a['categoryName'] ?? '';

    //     return a;
    //   }).toList();

    //   courseListFormatter
    //       .sort((a, b) => a['displayOrder'].compareTo(b['displayOrder']));
    //   e['courseItemList'] = courseListFormatter;

    //   var orderList = e['orderItemList'] as List<dynamic>;
    //   e['courseDeliveredCount'] =
    //       courseListFormatter.where((element) => element['delivered']).length;

    //   var orderListFormatter = orderList.map((a) {
    //     a['categoryName'] = ''; // make it empty
    //     return a;
    //   }).toList();

    //   orderListFormatter
    //       .sort((a, b) => a['displayOrder'].compareTo(b['displayOrder']));
    //   e['orderDeliveredCount'] =
    //       orderListFormatter.where((element) => element['delivered']).length;
    //   e['orderItemList'] = orderListFormatter;
    //   return e;
    // }).toList();

    // state = state.copyWith(lstTableServingProgress: list);
    return [];
  }
}
