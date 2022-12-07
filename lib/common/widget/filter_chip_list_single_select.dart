import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CheckBoxModel {
  late String key;
  late String label;
  bool isChecked;
  CheckBoxModel(this.key, this.label, {this.isChecked = false});
}

class FilterChipListSingleSelect extends HookConsumerWidget {
  FilterChipListSingleSelect({
    Key? key,
    this.chipName = "",
    this.leadingText = "",
    this.dataSource,
    this.isSingleSelect = false,
    this.onChangeValue,
    this.value = "",
  }) : super(key: key);
  String chipName = "";
  String leadingText = "";
  bool isSingleSelect;
  String value;
  List<CheckBoxModel>? dataSource;
  String? Function(String value)? onChangeValue;

  /// 検索機能
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dataSource ??= [];
    return StatefulBuilder(builder: (context, setState) {
      Widget _buildChips() {
        List<Widget> chips = [];

        for (int i = 0; i < dataSource!.length; i++) {
          FilterChip filterChip = FilterChip(
            selected: dataSource![i].key == value,
            label: Text(dataSource![i].label,
                style: const TextStyle(
                  color: Colors.white,
                )),
            pressElevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                side: BorderSide(color: Colors.grey.shade300)),
            checkmarkColor: Colors.black54,
            showCheckmark: false,
            selectedColor: Colors.blue,
            backgroundColor: Colors.grey,
            onSelected: (bool selected) {
              setState(() {
                value = selected ? dataSource![i].key : "";
              });

              onChangeValue!(value);
            },
          );

          chips.add(filterChip);
        }

        return Wrap(spacing: 6.0, runSpacing: 6.0, children: chips);
      }

      return _buildChips();
    });
  }
}
