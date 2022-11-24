import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hishig_erdem/main/main_route.dart';
import 'package:hishig_erdem/n5/test/pages/kanji/list/kanji_test_list_controller.dart';
import 'package:hishig_erdem/n5/test/pages/kanji/model/kanji_model.dart';
import 'package:hishig_erdem/n5/test/pages/listening/listening_test_list_controller.dart';
import 'package:hishig_erdem/n5/test/pages/listening/model/listening_test_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';

// pyfm060 : キャンセル規定一覧 ListeningTestList
class ListeningTestList extends HookConsumerWidget {
  ListeningTestList({Key? key}) : super(key: key);
  final _database = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("listeningTestList");
    final controller = ref.watch(listeningTestListController.notifier);
    GoRouter router = ref.read(mainRouteProvider).router;
    return Scaffold(
      body: //Expanded(child: FlashCardListItem(flashcards: flashCard)),
          Column(
        children: [
          StreamBuilder(
            stream: _database.child('ListeningTest').orderByKey().onValue,
            builder: (context, snapshot) {
              final tilesList = <Widget>[];

              if (snapshot.hasData &&
                  (snapshot.data! as Event).snapshot.value != null) {
                final myUsers = Map<String, dynamic>.from(
                    (snapshot.data! as Event).snapshot.value);
                myUsers.forEach((keyUser, value) {
                  final nextUser = ListeningTestModel.fromRTDB(
                      Map<String, dynamic>.from(value));

                  final userTile = Card(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: ListTile(
                        leading: const Icon(Icons.verified_user),
                        title: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(nextUser.name),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(nextUser.name),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child:
                                          Text(nextUser.writeDate.toString())),
                                ])
                          ],
                        ),
                        onTap: () {
                          router.goNamed("redirect-listening-test",
                              extra: nextUser, params: {'item': nextUser.name});

                          // controller.update(keyUser);
                        },
                      ),
                    ),
                  );
                  tilesList.add(userTile);
                });
                //## without key
                // tilesList.addAll(
                //     Map<String, dynamic>.from(myUsers).values.map((e) {
                //   final nextUser =
                //       User.fromRTDB(Map<String, dynamic>.from(e));
                //   return ListTile(
                //       leading: Icon(Icons.verified_user),
                //       title: Text(nextUser.name),
                //       subtitle: Column(children: [
                //         Text(nextUser.mobile),
                //         Text(nextUser.email)
                //       ]));
                // }));
              }
              return Expanded(
                  child: ListView(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                          flex: 1,
                          child: Text("Код",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ))),
                      Expanded(
                        flex: 2,
                        child: Text("Нэр",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("Бүртгэсэн огноо",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ]),
                ...tilesList
              ]));
            },
          )
        ],
      ),
    );
  }
}
