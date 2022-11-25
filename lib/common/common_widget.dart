import 'package:flutter/material.dart';
import 'package:hishig_erdem/common_frame_practice/listening/test/model/listening_test.dart';

Widget showErrorWidget(context, String title, Object? errorObject) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text(title),
    ),
    // drawer: const CommonDrawer(),
    body: ListView(shrinkWrap: true, children: [ErrorWidget(errorObject!)]),
  );
}

Widget showEmptyDataWidgetWithAppBar(context, String title) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text(title),
    ),
    body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
          Text(
            "Өгөгдөл олдсонгүй",
            style: TextStyle(fontSize: 26),
          )
        ])),
  );
}

Widget showEmptyDataWidget() {
  return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
        Text(
          "Өгөгдөл олдсонгүй",
          style: TextStyle(fontSize: 26),
        )
      ]));
}

showSuccessToastMessage(context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("Амжилттай " + message),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.green,
    ),
  );
}

showErrorToastMessage(context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("Алдаа：" + message),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red,
    ),
  );
}

answerSheet(context, List<ListeningQuestion> questions) {
  return ListTile(
    title: const Text("Тестийн хариу"),
    subtitle: ListView.builder(
        itemCount: questions.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return StatefulBuilder(builder: (context, setState) {
            var test = questions[index];
            var trueAnswer = test.answers.firstWhere((answer) => answer.isTrue);
            return ListTile(
              leading: trueAnswer.answer == test.selectedAnswer
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  : const Icon(
                      Icons.cancel,
                      color: Colors.red,
                    ),
              title: Text("${index + 1}. ${test.question}"),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("зөв хариулт: ${trueAnswer.answer}"),
                  Visibility(
                    visible: trueAnswer.answer != test.selectedAnswer,
                    child: Text("таны хариулт:${test.selectedAnswer}"),
                  )
                ],
              ),
            );
          });
        }),
  );
}
