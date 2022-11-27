import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hishig_erdem/main/main_route.dart';
import 'package:hishig_erdem/n5/test/pages/kanji/list/kanji_test_list_controller.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';

// pyfm060 : キャンセル規定一覧 KanjiTestList
class TestMenuList extends HookConsumerWidget {
  TestMenuList({Key? key}) : super(key: key);
  final _database = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("kanjiTestList");
    final controller = ref.watch(kanjiTestListController.notifier);
    GoRouter router = ref.read(mainRouteProvider).router;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Хишиг эрдэм: Япон хэлний хичээл"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.,
        children: [
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // loginState.hiveInfo = lstHiveInfo[selectedLevel - 1];
                router
                    .goNamed("redirect-n5-kanji-test", params: {'item': "N5"});
              },
              child: const SizedBox(
                  width: 120,
                  child: Text(
                    "Ханз",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  )),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // loginState.hiveInfo = lstHiveInfo[selectedLevel - 1];
              },
              child: const SizedBox(
                  width: 120,
                  child: Text(
                    "Шинэ үг",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
