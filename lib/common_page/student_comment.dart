import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hishig_erdem/common/common_widget.dart';
import 'package:hishig_erdem/common/enum_values.dart';
import 'package:hishig_erdem/common_frame_practice/common_widget/afen_rich_text_field.dart';
import 'package:hishig_erdem/common_frame_practice/common_widget/afen_text_field.dart';
import 'package:hishig_erdem/common_frame_practice/common_widget/save_button.dart';
import 'package:hishig_erdem/common_page/student_comment_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// pyfm061 : キャンセル規定編集
class StudentCommentPage extends HookConsumerWidget {
  StudentCommentPage({Key? key}) : super(key: key);
  final _database = FirebaseDatabase.instance.reference();
  AfenTextField txtUserName = AfenTextField("Нэр");
  AfenTextField txtTitle = AfenTextField("Гарчиг");
  AfenRichTextField txtComment = AfenRichTextField("Санал, хүсэлт");
  String commentType = "";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(studentCommentPageController.notifier);
    controller.setModelListenable(ref);

    return Scaffold(
        appBar: AppBar(
          title: Text(PopupMenu.commentSend.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                txtUserName,
                txtTitle,
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                      dropdownColor: Colors.white,
                      hint: const Text(" Агуулга сонгоно уу"),
                      isDense: true,
                      items: getDropItems(),
                      onChanged: (value) {
                        commentType = "$value";
                        // setState(() {
                        //   commentType = "$value";
                        // });
                      },
                    )),
                  ),
                ),
                txtComment,
                SaveButton(
                  onSave: () {
                    final commentData = <String, dynamic>{
                      'userName': txtUserName.controller.text,
                      'title': txtTitle.controller.text,
                      'commentType': commentType,
                      'comment': txtComment.controller.text,
                      'time': DateTime.now().microsecondsSinceEpoch
                    };
                    write(context, commentData);
                  },
                  label: "Илгээх",
                )
              ]),
        ));
  }

  void write(context, Map<String, dynamic> data) {
    // var _todoQuery = _database.child("/category");

    _database
        .child('UserComment')
        .push()
        .set(data)
        .then((value) => {
              showSuccessToastMessage(
                  context, "Санал хүсэлтийг илгээлээ. Танд баярлалаа")
            })
        .catchError((onError) => print('Хүсэлт илгээхэд алдаа гарлаа.'));
  }

  List<DropdownMenuItem<String>> getDropItems() {
    List<DropdownMenuItem<String>> lstDropItem = [];
    // for (var i = 1; i <= 5; i++) {
    //   lstDropItem.add(DropdownMenuItem<int>(
    //       alignment: AlignmentDirectional.center,
    //       value: i,
    //       child: Text(
    //         "$i",
    //         textAlign: TextAlign.center,
    //       )));
    // }
    lstDropItem = CommentType.values
        .map((e) => DropdownMenuItem<String>(
            alignment: AlignmentDirectional.center,
            value: e.id,
            child: Text(
              e.title,
              textAlign: TextAlign.center,
            )))
        .toList();
    return lstDropItem;
  }

  save(controller) {
    // var categoryCode = txtCode.controller.text;
    // var categoryName = txtName.controller.text;
    // CategoryModel category =
    //     CategoryModel(categoryCode, categoryName, DateTime.now());
    // controller.write(category);
  }
}
