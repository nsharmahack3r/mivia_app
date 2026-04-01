import 'package:flutter/material.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  static const String routePath = '/community';

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Community',
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
    );
  }
}
