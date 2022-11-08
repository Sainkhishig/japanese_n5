// import 'package:hishig_erdem/authentication/home.dart';
import 'package:hishig_erdem/authentication/login_controller.dart';
import 'package:hishig_erdem/main/login_state.dart';
import 'package:hishig_erdem/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'authentication_error.dart';
import 'registration.dart';

import 'email_check.dart';

class Login extends HookConsumerWidget {
  //#region ==================== local variable ====================
  // late KeycloakSetting keycloak;
  final GlobalKey<ScaffoldState> _mainScaffoldKey = GlobalKey<ScaffoldState>();
  //#endregion ==================== local variable ====================

  //#region ==================== constructor ====================
  Login({Key? key}) : super(key: key);
  //#endregion ==================== constructor ====================

  //#region ==================== accessor ====================
  //#endregion ==================== accessor ====================

  //#region ==================== method ====================

  // Firebase 認証
  final _auth = FirebaseAuth.instance;
  UserCredential? _result;
  User? _user;

  String _login_Email = ""; // 入力されたメールアドレス
  String _login_Password = ""; // 入力されたパスワード

  String _telephone = ""; // 入力されたパスワード
  String _address = ""; // 入力されたパスワード
  String _infoText = ""; // ログインに関する情報を表示

  // エラーメッセージを日本語化するためのクラス
  final auth_error = Authentication_error();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(loginHomeController.notifier);
    controller.setModelListenable(ref);

    var loginNotifier = ref.read(loginStateNotifierProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // メールアドレスの入力フォーム
            Padding(
                padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Цахим хаяг"),
                  onChanged: (String value) {
                    _login_Email = value;
                  },
                )),

            // パスワードの入力フォーム
            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Нууц үг（8～20тэмдэгт）"),
                obscureText: true, // パスワードが見えないようRにする
                maxLength: 20, // 入力可能な文字数
                maxLengthEnforced: false, // 入力可能な文字数の制限を超える場合の挙動の制御
                onChanged: (String value) {
                  _login_Password = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Утасны дугаар"),
                obscureText: true,
                maxLength: 20,
                maxLengthEnforced: false,
                onChanged: (String value) {
                  _telephone = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Хаяг"),
                obscureText: true,
                maxLength: 20,
                maxLengthEnforced: false,
                onChanged: (String value) {
                  _address = value;
                },
              ),
            ),

            // ログイン失敗時のエラーメッセージ
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 5.0),
              child: Text(
                _infoText,
                style: TextStyle(color: Colors.red),
              ),
            ),

            // ログインボタンの配置
            ButtonTheme(
              minWidth: 350.0,
              // height: 100.0,
              child: RaisedButton(
                // ボタンの形状
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
// ボタン内の文字や書式
                child: const Text(
                  'Нэвтрэх',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  try {
                    // メール/パスワードでログイン
                    _result = await _auth.signInWithEmailAndPassword(
                      email: _login_Email,
                      password: _login_Password,
                    );

                    // ログイン成功
                    _user = _result!.user; // ログインユーザーのIDを取得

                    // Email確認が済んでいる場合のみHome画面へ

                    if (_user!.emailVerified) {
                      loginNotifier.loggedIn = true;
                      loginNotifier.notifyListeners();
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Emailcheck(
                                email: _login_Email,
                                pswd: _login_Password,
                                from: 2)),
                      );
                    }
                  } catch (e) {
                    // ログインに失敗した場合
                    // setState(() {
                    //   _infoText = auth_error.login_error_msg("e:::$e");
                    // });
                  }
                },

                textColor: Colors.white,
                color: Colors.blue,
              ),
            ),

            // ログイン失敗時のエラーメッセージ
            TextButton(
              child: const Text('Нуур үг сэргээх'),
              onPressed: () =>
                  _auth.sendPasswordResetEmail(email: _login_Email),
            ),
          ],
        ),
      ),

      // 画面下にアカウント作成画面への遷移ボタンを配置
      bottomNavigationBar:
          Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ButtonTheme(
            minWidth: 350.0,
            // height: 100.0,
            child: RaisedButton(
                child: const Text(
                  'Бүртгэл үүсгэх',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                textColor: Colors.blue,
                color: Colors.blue[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

                // ボタンクリック後にアカウント作成用の画面の遷移する.
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) => Registration(),
                    ),
                  );
                }),
          ),
        ),
      ]),
    );
  }
}
