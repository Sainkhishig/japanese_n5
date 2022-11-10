import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SaveButton extends HookConsumerWidget {
  SaveButton({Key? key, this.onSave, this.label = "Хадгалах"})
      : super(key: key);

  /// 検索機能
  final VoidCallback? onSave;
  String label;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        width: 200,
        child: ElevatedButton(
          child: Text(label),
          onPressed: () => onSave?.call(),
        ));
  }
}
