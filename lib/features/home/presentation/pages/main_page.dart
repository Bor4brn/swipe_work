import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/themes/app_theme.dart';

class MainPage extends ConsumerStatefulWidget {
  final Widget child;
  
  const MainPage({super.key, required this.child});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  int _currentIndex = 0;

  final List<BottomNavigationItem> _navigationItems = [
    BottomNavigationItem(
      icon: Icons.swipe_outlined,
      activeIcon: Icons.swipe,
      label: 'İşler',
      route: AppRoutes.jobSwipe,
    ),
    BottomNavigationItem(
      icon: Icons.history_outlined,
      activeIcon: Icons.history,
      label: 'Başvurular',
      route: AppRoutes.applications,
    ),
    BottomNavigationItem(
      icon: Icons.person_outlined,
      activeIcon: Icons.person,
      label: 'Profil',
      route: AppRoutes.profile,
    ),
    BottomNavigationItem(
      icon: Icons.settings_outlined,
      activeIcon: Icons.settings,
      label: 'Ayarlar',
      route: AppRoutes.settings,
    ),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    context.go(_navigationItems[index].route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppTheme.backgroundLight,
        selectedItemColor: AppTheme.primaryRed,
        unselectedItemColor: AppTheme.textSecondary,
        elevation: 8,
        items: _navigationItems.map((item) {
          final index = _navigationItems.indexOf(item);
          return BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == index ? item.activeIcon : item.icon,
            ),
            label: item.label,
          );
        }).toList(),
      ),
    );
  }
}

class BottomNavigationItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final String route;

  BottomNavigationItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.route,
  });
}
