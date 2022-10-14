import 'package:afen_vocabulary/common/common_frame_practice/common_page/common_practice_page.dart';
import 'package:afen_vocabulary/common/common_frame_practice/listening/player/services/service_locator.dart';
import 'package:afen_vocabulary/common_frame_learning/common_frame.dart';
import 'package:afen_vocabulary/hive_db/object/dictionary.dart';
import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';
import 'common_providers/shared_preferences_provider.dart';

final flutterTts = FlutterTts();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  // await Firebase.initializeApp();
  await Hive.initFlutter();
  // Hive.resetAdapters();
  Hive.registerAdapter(DictionaryAdapter());
  setPathUrlStrategy();

  // await flutterTts.setIosAudioCategory(
  //     IosTextToSpeechAudioCategory.playAndRecord,
  //     [IosTextToSpeechAudioCategoryOptions.mixWithOthers]);

  // await flutterTts.setLanguage("ja-JP");
  // await flutterTts.setRate(1);
  // await flutterTts.setVolume(1.0);
  // await flutterTts.setPitch(0.5);

  // runApp(const ProviderScope(child: MyApp()));
  runApp(ProviderScope(
    overrides: [
      n5BoxDataProvider
          .overrideWithValue(N5Box(await Hive.openBox('N5BoxData'))),
      sharedPreferencesProvider.overrideWithValue(
        await SharedPreferences.getInstance(),
      ),
    ],
    child: MyApp(),
  ));
  // runApp(const MyApp());
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp();

//   setPathUrlStrategy();

//   // runApp(const ProviderScope(child: MyApp()));
//   runApp(ProviderScope(overrides: [
//     sharedPreferencesProvider.overrideWithValue(
//       await SharedPreferences.getInstance(),
//     ),
//   ], child: MyApp()));
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Хишиг эрдэм: Япон хэл - N5"),
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
                          builder: (context) => CommonFrameLearning()));
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
                          builder: (context) => CommonPracticePage()));
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
