import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomSearchBar extends HookConsumerWidget {
  CustomSearchBar({
    Key? key,
    required this.onSearch,
    this.hintText,
    this.widgetKey = "",
  }) : super(key: key);
  final TextEditingController keywordController = TextEditingController();

  /// widget key
  final String widgetKey;

  /// 検索機能
  // final String Function() onSearch;
  late Function(String searchKey)? onSearch;

  /// hint
  final String? hintText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    keywordController.selection = TextSelection.fromPosition(
        TextPosition(offset: keywordController.text.length));
    final FocusNode focusNodeForm = FocusNode();

    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        flex: 4,
        child: Padding(
            padding: EdgeInsets.all(8),
            child: TextFormField(
                key: Key(widgetKey),
                controller: keywordController,
                autofocus: false,
                focusNode: focusNodeForm,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: hintText ?? "хайх үг",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      keywordController.text = '';
                    },
                  ),
                ),
                onFieldSubmitted: (_) async =>
                    onSearch?.call(keywordController.text))),
      ),
      Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            width: 105,
            child: ElevatedButton(
              onPressed: () => onSearch?.call(keywordController.text),
              child: const Text("хайх"),
            ),
          ))
    ]);
  }
}
