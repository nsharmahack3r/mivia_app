import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mivia/src/common/widget/bottom_navigation.dart';
import 'package:mivia/src/features/community/view/community_view.dart';
import 'package:mivia/src/features/home/view/home_view.dart';
import 'package:mivia/src/features/journey/view/journey_view.dart';
import 'package:mivia/src/features/navigation/view/navigation_view.dart';
import 'package:mivia/src/features/profile/view/profile_view.dart';
import 'package:mivia/src/resources/assets.gen.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key, required this.child});

  final Widget child;

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  static const _routes = [
    HomeView.routePath,
    CommunityView.routePath,
    NavigationView.routePath,
    JourneyView.routePath,
  ];

  int _currentIndexFromLocation(String location) {
    final index = _routes.indexWhere((path) => location.startsWith(path));
    return index < 0 ? 0 : index;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: GestureDetector(
            onTap: () => context.go(ProfileView.routePath),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: Assets.images.profile.provider(),
            ),
          ),
        ),
        title: Assets.icons.branding.image(height: 30),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Badge(
              smallSize: 8,
              backgroundColor: Colors.redAccent,
              child: const Icon(Icons.notifications_outlined, size: 24),
            ),
          ),
        ],
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndexFromLocation(location),
        onTap: (index) => context.go(_routes[index]),
      ),
    );
  }
}
