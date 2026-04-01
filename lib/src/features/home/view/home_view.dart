import 'package:flutter/material.dart';
import 'package:mivia/src/features/home/widget/garage_section.dart';
import 'package:mivia/src/features/home/widget/trips_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routePath = '/home';

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          TripsSection(),
          SizedBox(height: 24),
          GarageSection(),
        ],
      ),
    );
  }
}
