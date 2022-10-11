import 'package:afen_vocabulary/common/common_frame_practice/reading/list/reading_list_controller.dart';
import 'package:afen_vocabulary/common/common_frame_practice/reading/model/reading_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';

// pyfm060 : キャンセル規定一覧 ReadingList
class ReadingList extends HookConsumerWidget {
  ReadingList({Key? key}) : super(key: key);
  final _database = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(readingListController.notifier);
    // controller.setModelListenable(ref);

    return Scaffold(
      body: //Expanded(child: FlashCardListItem(flashcards: flashCard)),
          Column(
        children: [
          Text("this is list"),
          StreamBuilder(
            stream: _database.child('reading').orderByKey().onValue,
            builder: (context, snapshot) {
              final tilesList = <Widget>[];

              if (snapshot.hasData) {
                // final datas = (snapshot.data! as Event).snapshot;
                // print("myUserKeydatas:$datas");
                final myUsers = Map<String, dynamic>.from(
                    (snapshot.data! as Event).snapshot.value);
                myUsers.forEach((keyUser, value) {
                  print("userkey$keyUser");
                  final nextUser =
                      ReadingModel.fromRTDB(Map<String, dynamic>.from(value));
                  print("gram*${nextUser.content}");
                  final userTile = Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 1.0, color: Colors.grey))),
                    child: ListTile(
                      leading: Icon(Icons.verified_user),
                      title: Text(nextUser.question),
                      subtitle: Column(children: [
                        Text(nextUser.answer),
                        Text(nextUser.writeDate.toString())
                      ]),
                      onTap: () {
                        controller.update(keyUser);
                      },
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
              return Expanded(child: ListView(children: tilesList));
            },
          )
        ],
      ),
    );
  }
}
