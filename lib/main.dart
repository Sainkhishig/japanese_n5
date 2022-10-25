import 'package:afen_vocabulary/authentication/login.dart';
import 'package:afen_vocabulary/common_frame_practice/listening/player/services/service_locator.dart';

import 'package:afen_vocabulary/hive_db/object/dictionary.dart';
import 'package:afen_vocabulary/hive_db/object/kanji_dictionary.dart';
import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
import 'package:afen_vocabulary/login_state.dart';
import 'package:afen_vocabulary/main_home.dart';
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
  await Hive.initFlutter();
  Hive.registerAdapter(DictionaryAdapter());
  Hive.registerAdapter(KanjiDictionaryAdapter());
  await setupServiceLocator();
  await flutterTts.setVoice({'name': 'Kyoko', 'locale': 'ja-JP'});
  // await Firebase.initializeApp();

  setPathUrlStrategy();
  // final state = LoginState();

  runApp(ProviderScope(
    overrides: [
      n5BoxDataProvider
          .overrideWithValue(N5Box(await Hive.openBox('N5BoxData'))),
      sharedPreferencesProvider.overrideWithValue(
        await SharedPreferences.getInstance(),
      ),
      // loginStateNotifierProvider.overrideWithValue(state),
    ],
    child: MyApp(),
  ));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
