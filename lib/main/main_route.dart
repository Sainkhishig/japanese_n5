import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hishig_erdem/authentication/login.dart';
import 'package:hishig_erdem/home_screen.dart';
import 'package:hishig_erdem/main/not_found_page.dart';
import 'package:hishig_erdem/n5/common/menu.dart';
import 'package:hishig_erdem/n5/learning/frame/n5_common_page.dart';
import 'package:hishig_erdem/n5/test/n5_test_frame_page.dart';
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
      // GoRoute(
      //   name: createAccountRouteName,
      //   path: '/create-account',
      //   pageBuilder: (context, state) => MaterialPage<void>(
      //     key: state.pageKey,
      //     child: const CreateAccount(),
      //   ),
      // ),
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
        // routes: [
        //   GoRoute(
        //     name: subDetailsRouteName,
        //     // 4
        //     path: 'details/:item',
        //     pageBuilder: (context, state) => MaterialPage<void>(
        //       key: state.pageKey,
        //       // 5
        //       child: Details(description: state.params['item']!),
        //     ),
        //   ),
        //   GoRoute(
        //     name: profilePersonalRouteName,
        //     path: 'personal',
        //     pageBuilder: (context, state) => MaterialPage<void>(
        //       key: state.pageKey,
        //       child: const PersonalInfo(),
        //     ),
        //   ),
        //   GoRoute(
        //     name: profilePaymentRouteName,
        //     path: 'payment',
        //     pageBuilder: (context, state) => MaterialPage<void>(
        //       key: state.pageKey,
        //       child: const Payment(),
        //     ),
        //   ),
        //   GoRoute(
        //     name: profileSigninInfoRouteName,
        //     path: 'signin-info',
        //     pageBuilder: (context, state) => MaterialPage<void>(
        //       key: state.pageKey,
        //       child: const SigninInfo(),
        //     ),
        //   ),
        //   GoRoute(
        //     name: profileMoreInfoRouteName,
        //     path: 'more-info',
        //     pageBuilder: (context, state) => MaterialPage<void>(
        //       key: state.pageKey,
        //       child: const MoreInfo(),
        //     ),
        //   ),
        // ],
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
      )
      // TODO: Add Other routes
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: NotFoundPage(), //ErrorPage(error: state.error),
    ),
    redirect: (state) {
      // 1
      final loginLoc = state.namedLocation("login");
      // 2
      final loggingIn = state.subloc == loginLoc;
      // 3
      // final createAccountLoc = state.namedLocation(createAccountRouteName);
      // final creatingAccount = state.subloc == createAccountLoc;
      // 4
      final loggedIn = loginState.loggedIn;
      final rootLoc = state.namedLocation("home");

      // 5
      if (!loggedIn && !loggingIn) return loginLoc;
      if (loggedIn && (loggingIn)) return rootLoc;
      // return rootLoc;
    },
  );
}
