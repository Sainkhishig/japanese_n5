// import 'package:hishig_erdem/authentication/home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hishig_erdem/main_home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PlanFee extends StatefulWidget {
  @override
  _PlanFee createState() => _PlanFee();
}

class _PlanFee extends State<PlanFee> {
  // Firebase 認証
  final _auth = FirebaseAuth.instance;
  UserCredential? _result;
  User? _user;

  String _login_Email = ""; // 入力されたメールアドレス
  String _login_Password = ""; // 入力されたパスワード

  String _telephone = ""; // 入力されたパスワード
  String _address = ""; // 入力されたパスワード
  String _infoText = ""; // ログインに関する情報を表示
  final _database = FirebaseDatabase.instance.reference();
  // エラーメッセージを日本語化するためのクラス
  // final auth_error = Authentication_error();

  @override
  Widget build(BuildContext context) {
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomeScreen(user_id: _user!.uid, auth: _auth),
                        ),
                      );
                    } else {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => Emailcheck(
                      //           email: _login_Email,
                      //           pswd: _login_Password,
                      //           from: 2)),
                      // );
                    }
                  } catch (e) {
                    // ログインに失敗した場合
                    setState(() {
                      // _infoText = auth_error.login_error_msg("e:::$e");
                    });
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
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     fullscreenDialog: true,
                  //     builder: (BuildContext context) => Registration(),
                  //   ),
                  // );
                }),
          ),
        ),
      ]),
    );
  }

  sendPlanRequest() {
    final newData = <String, dynamic>{
      'userId': "userName",
      'level': "N5",
      'planName': "",
      'paymentStatus': "waiting", //waiting, Complete
      'isCancelled': false,
      'startTime': DateTime.now().microsecondsSinceEpoch,
      'endTime': DateTime.now().microsecondsSinceEpoch,
      'writeDate': DateTime.now().microsecondsSinceEpoch,
    };
    _database
        .child('planRequest')
        .push()
        .set(newData)
        .then((value) => {
              print('planRequest written'),
            })
        .catchError((onError) {
      print('could not saved data');
    });
  }

  Widget planSelectionBody(lstPlan, context, controller) {
    // var title = lstCounter.map((e) => e.wordMn.join(',')).toList();
    var title = lstPlan.map<String>((value) => value.wordMn).join(',');

    return Card(
        child: Column(
      children: [
        Text(title.substring(1)),
        const SizedBox(
          height: 5,
        ),
        Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 30),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 0,
                        crossAxisCount: lstPlan.length,
                        mainAxisExtent: MediaQuery.of(context).size.height /
                            lstPlan.length),
                    itemCount: lstPlan.length,
                    itemBuilder: (BuildContext ctx, index) {
                      PlanSelection counter = lstPlan[index];
                      return Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              borderWidget(counter.level,
                                  fontWight: FontWeight.bold),
                              borderWidget(counter.oneMonth),
                              borderWidget(counter.twoMonth),
                              borderWidget(counter.threeMonth),
                            ],
                          ));
                    })))
      ],
    ));
  }

  Widget borderWidget(String text,
      {double heightRow = 50, FontWeight fontWight = FontWeight.normal}) {
    return Container(
      height: heightRow,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: fontWight),
      ),
    );
  }
}

// class planSelec {
//   late NumberOrder sampleCounter;
//   late String wordMn;
//   late String kanji;
//   late String wordEN;
//   late String reading;

//   CounterGroup(
//       this.wordEN, this.kanji, this.reading, this.wordMn, this.sampleCounter);
// }

class PlanSelection {
  late String level;
  late String oneMonth;
  late String twoMonth;
  late String threeMonth;
  PlanSelection(this.level, this.oneMonth, this.twoMonth, this.threeMonth);
}

var lstPlan = <PlanSelection>[
  PlanSelection("N5", "40000", "60000", "60000"),
  PlanSelection("N4", "50", "75000", "100000"),
  PlanSelection("N3", "50", "75000", "100000"),
  PlanSelection("N5", "70", "105000", "140000"),
  PlanSelection("N5", "70", "105000", "140000"),
];
// 1сар	40	50	50	70	70
// 2сар	60	75	75	105	105
// 3сар	80	100	100	140	140

class PlanModel {
  late String userId;
  late String level;
  late String planName;
  late String paymentStatus;
  late String isCancelled;
  late String startTime;
  late String endTime;
  late String writeDate;
}
