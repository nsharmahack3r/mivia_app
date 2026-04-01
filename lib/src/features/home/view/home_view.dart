import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routePath = '/home';

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home', style: TextStyle(color: Colors.black, fontSize: 18)),
    );
  }
}
