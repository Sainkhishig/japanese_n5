import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginStateNotifierProvider =
    StateNotifierProvider<LoginState, bool>((ref) {
  return LoginState(widgetRef: ref);
});

class LoginState extends StateNotifier<bool> {
  LoginState({required this.widgetRef}) : super(false);
  //#region ==================== local variable ====================

  final StateNotifierProviderRef widgetRef;
  bool isLoginStateChanged = false;
  void logOut() async {
    // prefs.setBool("ClickedLogoutButton", true);
    // await keycloak.service.logout();
    // await auth!.signOut();
  }

  void setLoginState(bool kcLogin) {
    // loggedIn = kcLogin;
    // isLoginStateChanged = kcLogin;
    state = kcLogin;
  }

  // setRailIndex(int index) async {
  //   railIndex = index;
  // }

  //#endregion ==================== method ====================
}

class Menu {
  late String name;
  late String destination;
  late IconData icon;
  Menu(this.name, this.destination, this.icon);
}
