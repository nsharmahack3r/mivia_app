import 'package:flutter/material.dart';

class JourneyView extends StatelessWidget {
  const JourneyView({super.key});

  static const String routePath = '/journey';

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Journey',
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
    );
  }
}
