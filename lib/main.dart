import 'package:afen_vocabulary/common/common_frame_learning/common_frame.dart';
import 'package:afen_vocabulary/hive_db/object/dictionary.dart';
import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:url_strategy/url_strategy.dart';
import 'common_providers/shared_preferences_provider.dart';

final flutterTts = TextToSpeech();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Hive.initFlutter();
  // Hive.resetAdapters();
  Hive.registerAdapter(DictionaryAdapter());
  setPathUrlStrategy();
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
    child: const CommonFrameLearning(),
  ));
  // runApp(const MyApp());
}
