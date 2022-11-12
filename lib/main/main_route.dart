import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hishig_erdem/authentication/login.dart';
import 'package:hishig_erdem/authentication/registration.dart';
import 'package:hishig_erdem/common_page/student_comment.dart';

import 'package:hishig_erdem/home_screen.dart';
import 'package:hishig_erdem/main/not_found_page.dart';
import 'package:hishig_erdem/n5/common/menu.dart';
import 'package:hishig_erdem/n5/learning/frame/n5_common_page.dart';
import 'package:hishig_erdem/n5/test/n5_test_frame_page.dart';
import 'package:hishig_erdem/n5/test/pages/kanji/model/kanji_model.dart';
import 'package:hishig_erdem/n5/test/pages/kanji/test/kanji_test.dart';
import 'package:hishig_erdem/popup_menu_pages/fee/plan_fee.dart';
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
        name: "registration",
        path: '/create-account',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: Registration(),
        ),
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
                child: KanjiTestPage(
                  description: state.extra as KanjiTestModel,
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
          "kanji-test-n5",
          params: {'tab': 'testKanjiN5', 'item': state.params['item']!},
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
