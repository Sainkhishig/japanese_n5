import 'package:firebase_auth/firebase_auth.dart';
import 'package:hishig_erdem/common_frame_practice/listening/player/services/service_locator.dart';

import 'package:hishig_erdem/hive_db/object/dictionary.dart';
import 'package:hishig_erdem/hive_db/object/kanji_dictionary.dart';
import 'package:hishig_erdem/hive_db/provider/n1_box_provider.dart';
import 'package:hishig_erdem/hive_db/provider/n2_box_provider.dart';
import 'package:hishig_erdem/hive_db/provider/n3_box_provider.dart';
import 'package:hishig_erdem/hive_db/provider/n4_box_provider.dart';
import 'package:hishig_erdem/hive_db/provider/n5_box_provider.dart';
import 'package:hishig_erdem/main/init_app.dart';
import 'package:hishig_erdem/main/login_state.dart';
import 'package:hishig_erdem/main/main_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  // FirebaseAuth auth =
  // setPathUrlStrategy();
  // final state = LoginState();
  final state = LoginState(await SharedPreferences.getInstance());
  runApp(ProviderScope(
    overrides: [
      mainRouteProvider.overrideWithValue(MainRoute(state)),
      loginStateNotifierProvider.overrideWithValue(state),
      n5BoxDataProvider
          .overrideWithValue(N5Box(await Hive.openBox('N5BoxData'))),
      n4BoxDataProvider
          .overrideWithValue(N4Box(await Hive.openBox('N4BoxData'))),
      n3BoxDataProvider
          .overrideWithValue(N3Box(await Hive.openBox('N3BoxData'))),
      n2BoxDataProvider
          .overrideWithValue(N2Box(await Hive.openBox('N2BoxData'))),
      n1BoxDataProvider
          .overrideWithValue(N1Box(await Hive.openBox('N1BoxData'))),
      sharedPreferencesProvider.overrideWithValue(
        await SharedPreferences.getInstance(),
      ),
      firebaseAuthProvider.overrideWithValue(
        await FirebaseAuth.instance,
      ),
      // loginStateNotifierProvider.overrideWithValue(state),
    ],
    child: InitApp(),
  ));
}

// class MyApp extends HookConsumerWidget {
//   const MyApp({Key? key}) : super(key: key);
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }
