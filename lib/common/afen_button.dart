import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AfenButton extends HookConsumerWidget {
  const AfenButton(
      {Key? key, required this.onClick, this.child = const Text("Нэмэх")})
      : super(key: key);
  final VoidCallback? onClick;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final loginRole = ref.read(loginStateNotifierProvider).role;
    // final visible = [ROOT_ADMIN].contains(loginRole);
    const visible = true;

    return Visibility(
      visible: visible,
      child: SizedBox(
        width: 90,
        child: ElevatedButton(
            // key: const Key("registrationButton"),
            child: child,
            onPressed: onClick),
      ),
    );
  }
}
