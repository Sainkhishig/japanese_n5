import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hishig_erdem/main/main_route.dart';
import 'package:hishig_erdem/n5/test/pages/kanji/list/kanji_test_list_controller.dart';
import 'package:hishig_erdem/n5/test/pages/kanji/model/kanji_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';

// pyfm060 : キャンセル規定一覧 KanjiTestList
class KanjiTestList extends HookConsumerWidget {
  KanjiTestList({Key? key}) : super(key: key);
  final _database = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("kanjiTestList");
    final controller = ref.watch(kanjiTestListController.notifier);
    // controller.setModelListenable(ref);
// StreamBuilder(
//             stream: _database.child('KanjiExercises').orderByKey().onValue,
//             builder: (context, snapshot) {
//               final tilesList = <Widget>[];

//               if ((snapshot.data! as Event).snapshot.value != null &&
//                   snapshot.hasData) {
//                 final myUsers = Map<String, dynamic>.from(
//                     (snapshot.data! as Event).snapshot.value);

//                 myUsers.forEach((keyUser, value) {
//                   print("userkey$keyUser");

//                   final userTile = Container(
//                     decoration: const BoxDecoration(
//                         border: Border(
//                             bottom:
//                                 BorderSide(width: 1.0, color: Colors.grey))),
//                     child: ListTile(
//                       leading: const Icon(Icons.verified_user),
//                       title: Column(
//                         children: [
//                           Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   flex: 1,
//                                   child: Text(value["name"]),
//                                 ),
//                               ])
//                         ],
//                       ),
//                       onTap: () {
//                         var exercise = KanjiTestModel.fromRTDB(value);
//                         exercise.key = keyUser;
//                         // controller.setDetailData(exercise);
//                       },
//                     ),
//                   );
//                   tilesList.add(userTile);
//                 });
//               }
//               return Expanded(child: ListView(children: [...tilesList]));
//             },
//           ),
    GoRouter router = ref.read(mainRouteProvider).router;
    return Scaffold(
      body: //Expanded(child: FlashCardListItem(flashcards: flashCard)),
          Column(
        children: [
          StreamBuilder(
            stream: _database.child('KanjiExercises').orderByKey().onValue,
            builder: (context, snapshot) {
              final tilesList = <Widget>[];
              print("userkey99");
              if (snapshot.hasData &&
                  (snapshot.data! as Event).snapshot.value != null) {
                print("userkey9988");
                // final datas = (snapshot.data! as Event).snapshot;
                // print("myUserKeydatas:$datas");
                final myUsers = Map<String, dynamic>.from(
                    (snapshot.data! as Event).snapshot.value);
                myUsers.forEach((keyUser, value) {
                  print("userkey$keyUser");
                  final nextUser =
                      KanjiTestModel.fromRTDB(Map<String, dynamic>.from(value));
                  print("gram*${nextUser.name}");
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
                          router.goNamed("redirect-n5-kanji-test",
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
