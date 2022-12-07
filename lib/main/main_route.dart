import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hishig_erdem/authentication/login.dart';
import 'package:hishig_erdem/authentication/registration.dart';
import 'package:hishig_erdem/common_frame_learning/common_page/common_frame.dart';
import 'package:hishig_erdem/common_frame_practice/common_page/common_practice_page.dart';
import 'package:hishig_erdem/common_frame_practice/grammar/test/grammar_test.dart';
import 'package:hishig_erdem/common_frame_practice/listening/test/listening_page.dart';
import 'package:hishig_erdem/common_frame_practice/listening/test/model/listening_test.dart';
import 'package:hishig_erdem/common_frame_practice/reading/test/reaging_test.dart';
import 'package:hishig_erdem/common_frame_practice/vocabulary/test/vocabulary_test.dart';
import 'package:hishig_erdem/common_page/student_comment.dart';

import 'package:hishig_erdem/home_screen.dart';
import 'package:hishig_erdem/main/not_found_page.dart';
import 'package:hishig_erdem/n5/common/frame/elementary_frame_page.dart';
import 'package:hishig_erdem/n5/common/menu.dart';
import 'package:hishig_erdem/n5/learning/frame/n5_common_page.dart';
import 'package:hishig_erdem/n5/test/n5_test_frame_page.dart';
import 'package:hishig_erdem/n5/test/pages/kanji/test/kanji_test.dart';
import 'package:hishig_erdem/n5/test/pages/listening/test/listening_test.dart';
import 'package:hishig_erdem/popup_menu_pages/fee/plan_fee.dart';
import 'package:hishig_erdem/popup_menu_pages/user_info/admin_page.dart';
import 'package:hishig_erdem/popup_menu_pages/user_info/user_info.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'login_state.dart';

final mainRouteProvider =
    Provider<MainRoute>((ref) => throw UnimplementedError());

class MainRoute {
  final LoginState loginState;

  MainRoute(
    this.loginState,
  );

  late final router = GoRouter(
    // 3
    refreshListenable: loginState,
    // 4
    debugLogDiagnostics: true,
    // 5
    urlPathStrategy: UrlPathStrategy.path,

    // 6
    routes: [
      GoRoute(
        name: "root",
        path: '/',
        redirect: (state) =>
            // TODO: Change to Home Route
            state.namedLocation(
          "home",
        ),
      ),
      GoRoute(
        name: "home",
        path: '/home',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: HomeScreen(),
        ),
      ),
      GoRoute(
        name: "login",
        path: '/login',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: Login(),
        ),
      ),
      GoRoute(
        name: "userInfo",
        path: '/userInfo',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: UserInfoPage(),
        ),
      ),
      GoRoute(
        name: "commentSend",
        path: '/commentSend',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: StudentCommentPage(),
        ),
      ),
      GoRoute(
        name: "planFee",
        path: '/planFee',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: PlanFee(),
        ),
      ),
      GoRoute(
        name: "courseFee",
        path: '/courseFee',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: AdminPage(),
        ),
      ),
      GoRoute(
        name: "registration",
        path: '/create-account',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: Registration(),
        ),
      ),
      GoRoute(
        name: "elementary-lesson",
        // 1
        path:
            '/japanese/:tab(${elementaryLessonMenu.map((e) => e.destination).toList().join('|')})',
        pageBuilder: (context, state) {
          // 2
          final tab = state.params['tab']!;
          // final facilityId = state.params['facilityId']!;
          return MaterialPage<void>(
            key: state.pageKey,
            // 3
            child: ElementaryFramePage(
              destination: tab,
            ),
          );
        },
      ),
      GoRoute(
        name: "n5-lesson",
        // 1
        path:
            '/n5lesson/:tab(${learningMenuN5.map((e) => e.destination).toList().join('|')})',
        pageBuilder: (context, state) {
          // 2
          final tab = state.params['tab']!;
          // final facilityId = state.params['facilityId']!;
          return MaterialPage<void>(
            key: state.pageKey,
            // 3
            child: N5LearningCommonPage(
              destination: tab,
            ),
          );
        },
      ),
      GoRoute(
        name: "common-lesson",
        // 1
        path:
            '/commonLesson/:tab(${learningMenuCommon.map((e) => e.destination).toList().join('|')})',
        pageBuilder: (context, state) {
          // 2
          final tab = state.params['tab']!;
          // final facilityId = state.params['facilityId']!;
          return MaterialPage<void>(
            key: state.pageKey,
            // 3
            child: CommonFrameLearning(
              destination: tab,
            ),
          );
        },
      ),
      GoRoute(
          name: "common-test",
          // 1
          path:
              '/test/:tab(${practiceMenuCommon.map((e) => e.destination).toList().join('|')})',
          pageBuilder: (context, state) {
            // 2
            final tab = state.params['tab']!;
            // final facilityId = state.params['facilityId']!;
            return MaterialPage<void>(
              key: state.pageKey,
              // 3
              child: CommonPagePractice(
                destination: tab,
              ),
            );
          },
          routes: [
            GoRoute(
              name: "common-kanji-test",
              // 4
              path: 'kanjiTest/:item',
              pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                // 5
                child: CommonTestKanji(),
              ),
            ),
            GoRoute(
              name: "common-vocabulary-test",
              // 4
              path: 'vocabularyTest/:item',
              pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                // 5
                child: CommonTestVocabulary(),
              ),
            ),
            GoRoute(
              name: "common-grammar-test",
              // 4
              path: 'grammarTest/:item',
              pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                // 5
                child: CommonTestGrammar(),
              ),
            ),
            GoRoute(
              name: "common-reading-test",
              // 4
              path: 'readingTest/:item',
              pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                // 5
                child: CommonTestReading(),
              ),
            ),
            GoRoute(
              name: "common-listening-test",
              // 4
              path: 'listeningTest/:item',
              pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                // 5
                child: ListeningPage(),
              ),
            ),
          ]),
      GoRoute(
        name: "go-kanji-test",
        // 2
        path: '/kanjiTest/:item',
        // 3
        redirect: (state) => state.namedLocation(
          "common-kanji-test",
          params: {'tab': 'kanji', 'item': state.params['item']!},
        ),
      ),
      GoRoute(
        name: "go-vocabulary-test",
        // 2
        path: '/vocabularyTest/:item',
        // 3
        redirect: (state) => state.namedLocation(
          "common-vocabulary-test",
          params: {'tab': 'vocabulary', 'item': state.params['item']!},
        ),
      ),
      GoRoute(
        name: "go-grammar-test",
        // 2
        path: '/grammarTest/:item',
        // 3
        redirect: (state) => state.namedLocation(
          "common-grammar-test",
          params: {'tab': 'grammar', 'item': state.params['item']!},
        ),
      ),
      GoRoute(
        name: "go-reading-test",
        // 2
        path: '/readingTest/:item',
        // 3
        redirect: (state) => state.namedLocation(
          "common-reading-test",
          params: {'tab': 'reading', 'item': state.params['item']!},
        ),
      ),

      GoRoute(
        name: "go-listening-test",
        // 2
        path: '/listeningTest/:item',
        // 3
        redirect: (state) => state.namedLocation(
          "common-listening-test",
          params: {'tab': 'listening', 'item': state.params['item']!},
        ),
      ),
      GoRoute(
          name: "n5-test",
          // 1
          path:
              '/n5test/:tab(${practiceMenuN5.map((e) => e.destination).toList().join('|')})',
          pageBuilder: (context, state) {
            // 2
            final tab = state.params['tab']!;
            // final facilityId = state.params['facilityId']!;
            return MaterialPage<void>(
              key: state.pageKey,
              // 3
              child: N5PracticeCommonPage(
                destination: tab,
              ),
            );
          },
          routes: [
            GoRoute(
              name: "kanji-test-n5",
              // 4
              path: 'details/:item',
              pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                // 5
                child: CommonTestKanji(),
              ),
            ),
            GoRoute(
              name: "listening-test",
              // 4
              path: 'listening/:item',
              pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                // 5
                child: ListeningTestPage(
                  description: state.extra as ListeningTest,
                ),
              ),
            ),
          ]),
      GoRoute(
        name: "redirect-n5-kanji-test",
        // 2
        path: '/redirect-n5-kanji-test/:item',
        // 3
        redirect: (state) => state.namedLocation(
          "common-kanji-test",
          params: {'tab': 'kanji', 'item': state.params['item']!},
        ),
      ),
      GoRoute(
        name: "redirect-listening-test",
        // 2
        path: '/redirect-listening-test/:item',
        // 3
        redirect: (state) => state.namedLocation(
          "listening-test",
          params: {'tab': 'testListening', 'item': state.params['item']!},
        ),
      ),
      // TODO: Add Other routes
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: NotFoundPage(), //ErrorPage(error: state.error),
    ),
    redirect: (state) {
      // if (loginState.loggedIn) {
      //   state.namedLocation("home");
      // }
      return null;
      // 1
      // final loginLoc = state.namedLocation("home");
      // final rootLoc = state.namedLocation("login");
      // // 2
      // final loggingIn = state.subloc == rootLoc;
      // // 3
      // // final createAccountLoc = state.namedLocation(createAccountRouteName);
      // // final creatingAccount = state.subloc == createAccountLoc;
      // // 4
      // final loggedIn = loginState.loggedIn;
      // // final rootLoc = state.namedLocation("login");
      // print("loggingIn:$loggingIn");
      // print("loggedIn:$loggedIn");
      // // 5
      // if (!loggedIn && !loggingIn) return loginLoc;
      // if (loggedIn && (loggingIn)) return rootLoc;
      // return rootLoc;
    },
  );
}
