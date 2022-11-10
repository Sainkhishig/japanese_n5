// import 'package:adaptive_navigation/adaptive_navigation.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:hishig_erdem/common_providers/shared_preferences_provider.dart';
// import 'package:hishig_erdem/main/login_state.dart';
// import 'package:hishig_erdem/main/main_route.dart';
// import 'package:hishig_erdem/n5/common/menu.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// AdaptiveAppBar commonAppBar(context, WidgetRef ref, String title) {
//   final goRouter = ref.read(mainRouteProvider);

//   final loginStateNotifier = ref.read(loginStateNotifierProvider);
//   FirebaseAuth auth = ref.read(firebaseAuthProvider);
//   // final facilityState = ref.read(facilityStateProvider);
//   // // final userName = prefs.getString("userName") ?? "";
//   // final fullname = prefs.getString("fullname") ?? "";
//   // final roleName = prefs.getString("roleName") ?? "";

//   return AdaptiveAppBar(
//     title: Text(learningMenuN5[controller.railIndex].name),
//     actions: [
//       ButtonBar(
//         children: [
//           IconButton(
//               onPressed: () {
//                 controller.setSpeechVisible(!controller.state.isShowSpeech);
//               },
//               icon: Icon((controller.isShowPreference ?? true)
//                   ? CupertinoIcons.volume_up
//                   : CupertinoIcons.volume_off)),
//         ],
//       ),
//       ButtonBar(
//         children: [
//           IconButton(
//               onPressed: () {
//                 controller.setGameMode(!controller.state.isGameMode);
//               },
//               icon: Icon(
//                 controller.state.isGameMode
//                     ? CupertinoIcons.book_circle
//                     : CupertinoIcons.rectangle_fill_on_rectangle_angled_fill,
//               )),
//         ],
//       ),
//       Visibility(
//           visible: destination == 'masterData',
//           child: Padding(
//               padding: const EdgeInsets.all(10),
//               child: DropdownButton(
//                 value: controller.state.masterDataDestination,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   color: Colors.black,
//                 ),
//                 items: lstMasterMenu
//                     .map((e) => DropdownMenuItem(
//                           value: e.destination,
//                           child: Text(e.name),
//                         ))
//                     .toList(),
//                 onChanged: (lvl) async {
//                   controller.setMasterDataDestination(lvl as String);
//                 },
//               ))),
//       Visibility(
//           visible: destination == 'allVocabulary',
//           child: Padding(
//               padding: const EdgeInsets.all(10),
//               child: DropdownButton(
//                 value: controller.state.vocabularyMenuDestination,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   color: Colors.black,
//                 ),
//                 items: lstWordMenu
//                     .map((e) => DropdownMenuItem(
//                           value: e.destination,
//                           child: Text(e.name),
//                         ))
//                     .toList(),
//                 onChanged: (lvl) async {
//                   controller.setVocabularyDestination(lvl as String);
//                 },
//               ))),
//       Visibility(
//         visible: loginStateNotifier.loggedIn,
//         child: PopupMenuButton<String>(
//           icon: const Icon(Icons.person),
//           onSelected: (String popMenu) async {
//             switch (popMenu) {
//               case "Дасгал ажиллах эрх":
//                 Navigator.pushNamed(context, "/planFee");
//                 break;
//               default:
//             }
//           },
//           itemBuilder: (BuildContext context) {
//             return _popmenu_list.map((String s) {
//               return PopupMenuItem(
//                 child: Text(s),
//                 value: s,
//                 onTap: () {
//                   goRouter.router.goNamed("studentComment");
//                 },
//               );
//             }).toList();
//           },
//         ),
//       ),
//       IconButton(
//         padding: const EdgeInsets.only(bottom: 4),
//         disabledColor: Colors.grey,
//         // color: Colors.white,
//         icon: Icon(loginStateNotifier.loggedIn ? Icons.logout : Icons.login),
//         onPressed: () async {
//           if (!loginStateNotifier.loggedIn) {
//             goRouter.router.go("/login");
//             // loginStateNotifier.notifyListeners();
//           } else {
//             await auth!.signOut();
//             loginStateNotifier.userId = "";
//             loginStateNotifier.loggedIn = false;
//             loginStateNotifier.notifyListeners();
//             // controller.refreshState(loginStateNotifier.userId);
//           }
//         },
//       )
//     ],
//   );
// }
