import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:mivia/src/features/auth/view/login_view.dart';
import 'package:mivia/src/resources/assets.gen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late final AnimationController _slideController;
  late final AnimationController _rotateController;

  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 10.0),
      end: Offset.zero, // center
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _rotationAnimation = Tween<double>(begin: -math.pi / 3, end: 0).animate(
      CurvedAnimation(parent: _rotateController, curve: Curves.easeOut),
    );

    _startAnimation();
  }

  Future<void> _startAnimation() async {
    // Phase 1: slide up to center
    await _slideController.forward();
    // Phase 2: rotate right to upright
    await _rotateController.forward();
    // Navigate to login
    if (mounted) {
      context.pushReplacement(LoginView.routePath);
    }
  }

  @override
  void dispose() {
    _slideController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0D1B2A), // deep navy
              Color(0xFF1B2D45), // dark blue-grey
              Color(0xFF253A56), // muted slate blue
            ],
          ),
        ),
        child: Center(
          child: SlideTransition(
            position: _slideAnimation,
            child: AnimatedBuilder(
              animation: _rotationAnimation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotationAnimation.value,
                  child: child,
                );
              },
              child: Hero(
                tag: 'MAIN_ICON',
                child: Assets.icons.icon.image(width: 80, height: 80),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
