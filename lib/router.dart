import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mivia/src/app_wrapper.dart';
import 'package:mivia/src/features/auth/view/login_view.dart';
import 'package:mivia/src/features/auth/view/signup_view.dart';
import 'package:mivia/src/features/community/view/community_view.dart';
import 'package:mivia/src/features/home/view/home_view.dart';
import 'package:mivia/src/features/journey/view/journey_view.dart';
import 'package:mivia/src/features/navigation/view/navigation_view.dart';
import 'package:mivia/src/features/profile/view/profile_view.dart';
import 'package:mivia/src/features/splash/view/splash_view.dart';

final router = GoRouter(
  observers: [HeroController()],
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(
      path: LoginView.routePath,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: SignupView.routePath,
      builder: (context, state) => const SignupView(),
    ),

    ShellRoute(
      builder: (context, state, child) => AppWrapper(child: child),
      routes: [
        GoRoute(
          path: HomeView.routePath,
          builder: (context, state) => const HomeView(),
        ),
        GoRoute(
          path: CommunityView.routePath,
          builder: (context, state) => const CommunityView(),
        ),
        GoRoute(
          path: NavigationView.routePath,
          builder: (context, state) => const NavigationView(),
        ),
        GoRoute(
          path: JourneyView.routePath,
          builder: (context, state) => const JourneyView(),
        ),
        GoRoute(
          path: ProfileView.routePath,
          builder: (context, state) => const ProfileView(),
        ),
      ],
    ),
  ],
);
