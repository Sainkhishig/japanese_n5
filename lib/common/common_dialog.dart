import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showErroMessage(context, String text) {
  showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
            title: const Text(
              "Алдаа",
              style: TextStyle(fontSize: 14),
            ),
            content: Text(
              text,
              style: const TextStyle(color: Colors.red),
            ),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ));
}

Future<void> showWarningMessage(context, String title, String content) async {
  await showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(
              content,
              textAlign: TextAlign.left,
            ),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ));
}

Future<void> showInfoMessage(context, String title, String content) async {
  await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(
              content,
              textAlign: TextAlign.left,
            ),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ));
}

Future<bool> showConfirmationMessage(context, String title, String content,
    [String? labelFalse, String? labelTrue, int? distructiveIndex]) async {
  bool isConfirmed = false;
  await showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(
              content,
              textAlign: TextAlign.left,
            ),
            actions: [
              CupertinoDialogAction(
                isDestructiveAction:
                    distructiveIndex == null ? false : distructiveIndex == 0,
                child: Text(labelFalse ?? "үгүй"),
                onPressed: () {
                  isConfirmed = false;
                  Navigator.pop(context, false);
                },
              ),
              CupertinoDialogAction(
                isDestructiveAction:
                    distructiveIndex == null ? false : distructiveIndex == 1,
                child: Text(labelTrue ?? "тийм"),
                onPressed: () {
                  isConfirmed = true;
                  Navigator.pop(context, true);
                },
              ),
            ],
          ));
  return isConfirmed;
}

Future<bool> showPlanFeeConfirmationMessage(context, GoRouter router,
    [int? distructiveIndex]) async {
  var content =
      '''"Уучлаарай. Хишиг эрдэм сайт нь өдөрт ханз, дүрэм, шинэ үг, уншлага, сонсгол тус бүрт 1 тест ажиллах эрх нээдэг. 
  Маргааш дахин шинэ тест орох болно. 
  \n Хэрэв маргаашыг хүлээлгүй тестүүдийг ажиллахыг хүсвэл тест ажиллах эрхийг идэвхижүүлээрэй. 
  \n Тестийн эрх авах хуудас руу шилжих үү?  ''';
  bool isConfirmed = false;
  await showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
            title: const Text("Дасгал ажлын эрх идэвхигүй байна."),
            content: Container(
              // width: MediaQuery.of(context).size.width / 1.1,
              child: Text(
                content,
                textAlign: TextAlign.left,
              ),
            ),
            actions: [
              CupertinoDialogAction(
                isDestructiveAction:
                    distructiveIndex == null ? false : distructiveIndex == 0,
                child: const Text("үгүй"),
                onPressed: () {
                  isConfirmed = false;
                  Navigator.pop(context, false);
                },
              ),
              CupertinoDialogAction(
                isDestructiveAction:
                    distructiveIndex == null ? false : distructiveIndex == 1,
                child: const Text("тийм"),
                onPressed: () {
                  router.go("/PlanFee");
                  isConfirmed = true;
                  Navigator.pop(context, true);
                },
              ),
            ],
          ));
  return isConfirmed;
}
