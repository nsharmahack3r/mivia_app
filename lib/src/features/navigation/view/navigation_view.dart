import 'package:flutter/material.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  static const String routePath = '/navigation';

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Navigation',
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
    );
  }
}
