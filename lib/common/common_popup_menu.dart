import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hishig_erdem/common/enum_values.dart';
import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';
import 'package:hishig_erdem/main/login_state.dart';
import 'package:hishig_erdem/main/main_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

PopupMenuButton commonPopUpMenu(context, WidgetRef ref) {
  final goRouter = ref.read(mainRouteProvider);

  final loginStateNotifier = ref.read(loginStateNotifierProvider);
  FirebaseAuth auth = ref.read(firebaseAuthProvider);
  // final facilityState = ref.read(facilityStateProvider);
  // // final userName = prefs.getString("userName") ?? "";
  // final fullname = prefs.getString("fullname") ?? "";
  // final roleName = prefs.getString("roleName") ?? "";

  return PopupMenuButton<String>(
    icon: const Icon(Icons.person),
    onSelected: (String popMenu) async {
      // switch (popMenu) {
      //   case "Дасгал ажиллах эрх":
      //     Navigator.pushNamed(context, "/planFee");
      //     break;
      //   default:
      // }
      goRouter.router.goNamed(popMenu);
    },
    itemBuilder: (BuildContext context) {
      return PopupMenu.values.map((PopupMenu s) {
        return PopupMenuItem(
          child: Text(s.title),
          value: s.id,
          onTap: () {},
        );
      }).toList();
    },
  );
}
