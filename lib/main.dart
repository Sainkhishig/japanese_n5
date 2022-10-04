import 'package:afen_vocabulary/hive_db/object/dictionary.dart';
import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';
import 'common_page/common_frame.dart';
import 'common_providers/shared_preferences_provider.dart';

final flutterTts = FlutterTts();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Hive.initFlutter();
  // Hive.resetAdapters();
  Hive.registerAdapter(DictionaryAdapter());
  setPathUrlStrategy();
  List<dynamic> languages = await flutterTts.getLanguages;

  await flutterTts.setLanguage("ja-JP");
  await flutterTts.setSpeechRate(0.5);
  await flutterTts.setVolume(1.0);
  await flutterTts.setPitch(0.5);
  await flutterTts.isLanguageAvailable("ja-JP");

  // runApp(const ProviderScope(child: MyApp()));
  runApp(ProviderScope(
    overrides: [
      n5BoxDataProvider
          .overrideWithValue(N5Box(await Hive.openBox('N5BoxData'))),
      sharedPreferencesProvider.overrideWithValue(
        await SharedPreferences.getInstance(),
      ),
    ],
    child: const CommonFrame(),
  ));
  // runApp(const MyApp());
}
