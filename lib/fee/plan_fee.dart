// import 'package:hishig_erdem/authentication/home.dart';
import 'dart:html';

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
      body: Card(
          child: Column(
        children: [
          // Text(title.substring(1)),
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
                                borderWidget("${counter.oneMonth}"),
                                borderWidget("${counter.twoMonth}"),
                                borderWidget("${counter.threeMonth}"),
                              ],
                            ));
                      })))
        ],
      )),

// Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             //
//             // ログイン失敗時のエラーメッセージ
//             TextButton(
//               child: const Text('Нуур үг сэргээх'),
//               onPressed: () =>
//                   _auth.sendPasswordResetEmail(email: _login_Email),
//             ),
//           ],
//         ),
//       ),

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

  Widget planSelectionBody(List<PlanSelection> lstPlan, context) {
    // var title = lstCounter.map((e) => e.wordMn.join(',')).toList();
    // var title = lstPlan.map<String>((value) => value.wordMn).join(',');

    return Card(
        child: Column(
      children: [
        // Text(title.substring(1)),
        const SizedBox(
          height: 5,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 30),
          child:
              // ListView.builder(
              //     scrollDirection: Axis.vertical,
              //     shrinkWrap: true,
              //     itemCount: lstPlan.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Row(
              //         children: [
              //           TextButton(
              //             onPressed: () {},
              //             child: Text(lstPlan[index].level),
              //           )
              //         ],
              //       );
              //     })
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 0,
                      crossAxisCount: lstPlanByMonth.length,
                      mainAxisExtent:
                          MediaQuery.of(context).size.height / lstPlan.length),
                  itemCount: lstPlan.length,
                  itemBuilder: (BuildContext ctx, index) {
                    PlanSelection counter = lstPlan[index];
                    return Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            borderWidget(counter.level,
                                fontWight: FontWeight.bold),
                            borderWidget("${counter.oneMonth}"),
                            borderWidget("${counter.twoMonth}"),
                            borderWidget("${counter.threeMonth}"),
                          ],
                        ));
                  }),
        ))
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
  late double oneMonth;
  late double twoMonth;
  late double threeMonth;
  PlanSelection(this.level, this.oneMonth, this.twoMonth, this.threeMonth);
}

class PlanPriceByMonth {
  late String month;
  late double priceN5;
  late double priceN4;
  late double priceN3;
  late double priceN2;
  late double priceN1;
  PlanPriceByMonth(this.month, this.priceN5, this.priceN4, this.priceN3,
      this.priceN2, this.priceN1);
}

var lstPlanByMonth = <PlanPriceByMonth>[
  PlanPriceByMonth("1month", 40000, 50000, 50000, 50000, 50000),
  PlanPriceByMonth("2month", 60000, 75000, 75000, 100000, 100000),
  PlanPriceByMonth("3month", 80000, 100000, 100000, 140000, 140000),
];
var lstPlan = <PlanSelection>[
  PlanSelection("N5", 40000, 60000, 60000),
  PlanSelection("N4", 50, 75000, 100000),
  PlanSelection("N3", 50, 75000, 100000),
  PlanSelection("N5", 70, 105000, 140000),
  PlanSelection("N5", 70, 105000, 140000),
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
