import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mivia/src/features/auth/view/login_view.dart';
import 'package:mivia/src/features/splash/view/splash_view.dart';

final router = GoRouter(
  observers: [HeroController()],
  routes: <GoRoute>[
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(
      path: LoginView.routePath,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const LoginView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
  ],
);
