import 'package:afen_vocabulary/game/counter/counter_game_page.dart';
import 'package:afen_vocabulary/game/master_data/master_data_game_page.dart';
import 'package:afen_vocabulary/game/pronoun_game/pronoun_game_page.dart';
import 'package:afen_vocabulary/hive_db/object/dictionary.dart';
// import 'package:afen_vocabulary/hive_db/object/vocabulary.dart';
import 'package:afen_vocabulary/hive_db/provider/n5_box_provider.dart';
import 'package:afen_vocabulary/page/master/counter/counter_page.dart';
import 'package:afen_vocabulary/page/master/number_day/master_data_page.dart';
import 'package:afen_vocabulary/page/pronoun/pronoun_card_page.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';
import 'common_page/common_frame.dart';
import 'common_providers/shared_preferences_provider.dart';
import 'game/letter_game_page.dart';
import 'jp_constant/letter/letter_card_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Hive.initFlutter();
  // Hive.resetAdapters();
  Hive.registerAdapter(DictionaryAdapter());
  setPathUrlStrategy();

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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

class MyHomePage extends HookConsumerWidget {
  int _counter = 0;

  Future<void> readExcelFile(String fileName) async {
    ByteData data =
        await rootBundle.load("assets/xl/Vocabulary_of_JLPT_N5.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    int j = 0;
    for (var table in excel.tables.keys) {
      Map<int, dynamic> mp = Map<int, dynamic>();
      for (var row in excel.tables[table]!.rows) {
        mp[++j] = row;
      }
    }
  }

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var res = kanakit.toRomaji('ひらがな　カタカナ 17');
    // var res2 = kanakit.toHiragana('ひらがな　カタカナ 17');
    // final future = useMemoized(() => readExcelFile("vocabularydata.xlxs"));
    // final snapshot = useFuture(future, initialData: null);

    // if (snapshot.hasError) return ErrorWidget(snapshot.error!);
    // if (!snapshot.hasData) {
    //   return MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     builder: (context, _) =>
    //         const Scaffold(body: Text("Application Loading")),
    //   );
    // }

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Япон хэл"),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            // ElevatedButton(
            //   onPressed: () => {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => ImportVocabularyPage()))
            //   },
            //   child: const Text("import"),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // ElevatedButton(
            //   onPressed: () => {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => VocabularyCardPage()))
            //   },
            //   child: const Text("Шинэ үг"),
            // ),

            const SizedBox(
              height: 20,
            ),
            Row(children: [
              const SizedBox(
                width: 20,
                height: 20,
              ),
              const Text("Үсэг:"),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LetterCardPage()))
                },
                child: const Text("сурах"),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LetterGamePage()))
                },
                child: const Text("тоглох"),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            Row(children: [
              const SizedBox(
                width: 20,
              ),
              const Text("Тоо, Гараг, Сар өдөр:"),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MasterDataPage()))
                },
                child: const Text("сурах"),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MasterDataGamePage()))
                },
                child: const Text("тоглох"),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            // counter
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Text("Тоо тоолох нөхцөл:"),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CounterPage()))
                  },
                  child: const Text("сурах"),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CounterGamePage()))
                  },
                  child: const Text("тоглох"),
                )
              ],
            ),

            const SizedBox(
              height: 20,
            ),
            Row(children: [
              const SizedBox(
                width: 20,
              ),
              const Text("Төлөөний үг:"),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PronounCardPage()))
                },
                child: const Text("сурах"),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PronounGamePage()))
                },
                child: const Text("тоглох"),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
          ])),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
