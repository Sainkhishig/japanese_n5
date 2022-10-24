import 'package:afen_vocabulary/common_frame_learning/common_page/common_frame.dart';
import 'package:afen_vocabulary/common_frame_practice/common_page/common_practice_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String? user_id;
  final FirebaseAuth? auth;

  HomeScreen({Key? key, this.user_id, this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Хишиг эрдэм: Япон хэл - N5"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommonFrameLearning(
                                user_id: user_id,
                                auth: auth,
                              )));
                },
                child: const Text(
                  "Хичээл",
                  style: TextStyle(fontSize: 30),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CommonPracticePage()));
                },
                child: const Text(
                  "Дасгал",
                  style: TextStyle(fontSize: 30),
                )),
          )
        ],
      ),
    );
  }
}
