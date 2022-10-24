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
  // final String? user_id;
  // late final FirebaseAuth? auth;

  // final SharedPreferences prefs;
  // String _userName = "";
  // String _fullname = "";

  // int railIndex = 0;
  // bool readylogin = false;
  bool isLoginStateChanged = false;
  //#endregion ==================== local variable ====================

  //#region ==================== constructor ====================
  // LoginState(this.prefs, this.user_id, this.auth) {
  //   // loggedIn = prefs.getBool("LoggedIn") ?? false;
  //   // userName = prefs.getString("userName") ?? "";
  // }
  //#endregion ==================== constructor ====================

  //#region ==================== accessor ====================

  // String get userName => _userName;
  // set userName(String value) {
  //   _userName = value;
  //   prefs.setString("userName", value);
  // }

  // String get fullname => _fullname;
  // set fullname(String value) {
  //   _fullname = value;
  //   prefs.setString("fullname", value);
  // }

  //#endregion ==================== accessor ====================

  //#region ==================== method ====================

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
