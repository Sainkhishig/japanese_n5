import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hishig_erdem/common/common_dialog.dart';
import 'package:hishig_erdem/common/common_widget.dart';
import 'package:hishig_erdem/common/enum_values.dart';
import 'package:hishig_erdem/main/login_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlanFee extends HookConsumerWidget {
  // Firebase 認証
  final _database = FirebaseDatabase.instance.reference();
  late LoginState loginState;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    loginState = ref.read(loginStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(PopupMenu.planFee.title),
      ),
      body: Card(
          child: Column(children: [
        // Text(title.substring(1)),
        const SizedBox(
          height: 5,
        ),
        // ListView.builder(itemBuilder: (context, index) {
        //   return Ro
        // },)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(""),
            ...[1, 2, 3]
                .map((e) => Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          "$e сар",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          textAlign: TextAlign.center,
                        ))))
                .toList()
          ],
        ),
        ...lstPlan.map((plan) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${plan.level} түвшин"),
              ...plan.levelPrice.map((levelPrice) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: levelPrice.month == 1
                              ? Colors.red.shade300
                              : levelPrice.month == 2
                                  ? Colors.blue.shade300
                                  : Colors.green.shade300),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          // height: 60,
                          // padding: EdgeInsets.all(10),
                          child: Text(
                            "${levelPrice.price}",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        var isConfirmed = await showConfirmationMessage(
                            context,
                            "${plan.level} дасгалын эрх авах",
                            "Та дараах эрхийг идэвхижүүлэхдээ итгэлтэй байна уу? \n${levelPrice.month} сар: ${levelPrice.price}");
                        if (isConfirmed) {
                          var requestSent = await sendPlanRequest(
                              plan.level, levelPrice.month, levelPrice.price);
                          if (requestSent) {
                            showInfoMessage(context, "Хүсэлт илгээлээ",
                                "Та дараах дансанд төлбөрөө шилжүүлсний дараа хэрэглэгчийн мэдээлэл цэс рүү орж төлбөр төлсөн мэдэгдлээ илгээнэ үү.");
                          } else {
                            showErrorToastMessage(context,
                                "Уучлаарай хүсэлт амжилтгүй боллоо. Та манай пэйж хуудсанд холбогдоно уу.");
                          }
                        }
                      },
                    ),
                  ),
                );
              })
            ],
          );
        })
      ])),
    );
  }

  Future<bool> sendPlanRequest(level, plan, planfee) async {
    final newData = <String, dynamic>{
      'userId': loginState.userId,
      'userName': loginState.userName,
      'level': "$level",
      'plan': plan,
      'planfee': plan,
      'paymentStatus': "waiting", //waiting, Complete
      'isCancelled': false,
      'startTime': DateTime.now().microsecondsSinceEpoch,
      'endTime': DateTime.now().microsecondsSinceEpoch,
      'writeDate': DateTime.now().microsecondsSinceEpoch,
    };
    try {
      await _database.child('planRequest').push().set(newData);
      return true;
    } catch (ex) {
      print("ex");
      return false;
    }
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

class LevelFeeSelection {
  late String level;
  late List<LevelPrice> levelPrice;
  LevelFeeSelection(this.level, this.levelPrice);
}

class LevelPrice {
  late int month;
  late double price;
  LevelPrice(this.month, this.price);
}

class PlanPrice {
  late int level;
  late double price;
  PlanPrice(this.level, this.price);
}

class PlanPriceByMonth {
  late String month;
  late List<PlanPrice> price;
  PlanPriceByMonth(this.month, this.price);
}

var lstPlanByMonth = <PlanPriceByMonth>[
  PlanPriceByMonth("1month", planPriceOneMonth),
  PlanPriceByMonth("2month", planPriceTwoMonth),
  PlanPriceByMonth("3month", planPriceThreeMonth),
];
var planPriceOneMonth = [
  PlanPrice(5, 40000),
  PlanPrice(4, 50000),
  PlanPrice(3, 50000),
  PlanPrice(2, 70000),
  PlanPrice(1, 70000),
];
var planPriceTwoMonth = [
  PlanPrice(5, 60000),
  PlanPrice(4, 75000),
  PlanPrice(3, 75000),
  PlanPrice(2, 100000),
  PlanPrice(1, 100000),
];
var planPriceThreeMonth = [
  PlanPrice(5, 80000),
  PlanPrice(4, 100000),
  PlanPrice(3, 100000),
  PlanPrice(2, 140000),
  PlanPrice(1, 140000),
];
var lstPlan = <LevelFeeSelection>[
  LevelFeeSelection("N5", priceN5),
  LevelFeeSelection("N4", priceN4),
  LevelFeeSelection("N3", priceN3),
  LevelFeeSelection("N5", priceN2),
  LevelFeeSelection("N5", priceN1),
];

var priceN5 = [
  LevelPrice(1, 40000),
  LevelPrice(2, 60000),
  LevelPrice(3, 60000),
];

var priceN4 = [
  LevelPrice(1, 50000),
  LevelPrice(2, 75000),
  LevelPrice(3, 100000),
];

var priceN3 = [
  LevelPrice(1, 50000),
  LevelPrice(2, 75000),
  LevelPrice(3, 100000),
];

var priceN2 = [
  LevelPrice(1, 70000),
  LevelPrice(2, 105000),
  LevelPrice(3, 140000),
];

var priceN1 = [
  LevelPrice(1, 70000),
  LevelPrice(2, 105000),
  LevelPrice(3, 140000),
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
