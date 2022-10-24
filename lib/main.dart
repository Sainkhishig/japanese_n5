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

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//       routes: <String, WidgetBuilder>{
//         '/login': (_) => Login(),
//       },
//     );
//   }
// }

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginStateNotifierProvider);
    // final keycloak = ref.read(keycloakProvider);

    // final future = useMemoized(() => setInitValue(notifier));
    // final snapshot = useFuture(future, initialData: null);
    // var location = window.location.pathname;
    // if (snapshot.hasError) return ErrorWidget(snapshot.error!);
    // if (!snapshot.hasData) {
    //   return MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     builder: (context, _) =>
    //         const Scaffold(body: Text("")), // Application Loading
    //   );
    // }
    // var isLoggedIn = snapshot.data ?? false;
    print("loginState${loginState}");
    return
        // notifier.logoutClicked
        //     ? MaterialApp(
        //         home: HomeScreen(),
        //         // routes: <String, WidgetBuilder>{
        //         //   '/login': (_) => Login(),
        //         // },
        //       )
        //     :
        MaterialApp(
      initialRoute: '/',
      home: loginState ? HomeScreen() : Login(),
      routes: {
        '/login': (context) => Login(),
      },
    );

    // ? HomeScreen()
    // // MaterialApp(
    // //     debugShowCheckedModeBanner: false,
    // //     builder: (context, _) => Scaffold(body: HomeScreen()))
    // : MaterialApp(
    //     initialRoute: '/',
    //     routes: {
    //       '/login': (context) => Login(),
    //     },
    //   );
  }

  // Future<bool?> setInitValue(LoginState notifier) async {
  //   KeycloakProfile? profile;
  //   var isLoggedIn = await keycloakService.isLoggedIn();
  //   notifier.loggedIn = isLoggedIn;
  //   if (isLoggedIn) {
  //     final token = await keycloakService.getToken();
  //     Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

  //     // NOTE: KeyCloakのrolesは role と permission を含めているため、authorities と呼称する
  //     notifier.authorities =
  //         decodedToken['realm_access']['roles'].cast<String>();

  //     profile = await keycloakService.loadUserProfile();
  //     notifier.userName = profile!.username;
  //     notifier.fullname = "${profile.lastName}${profile.firstName}";
  //   } else {
  //     notifier.userName = "";
  //     notifier.fullname = "";
  //     notifier.authorities = [];
  //   }

  //   return isLoggedIn;
  // }
}
