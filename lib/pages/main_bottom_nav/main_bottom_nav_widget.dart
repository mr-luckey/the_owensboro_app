import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/pages/home_page_dynamic/home_page_dynamic_widget.dart';
import '/pages/wheel_adventure_screen/wheel_adventure_screen_widget.dart';
import '/owensboro_games/owensboro_games_widget.dart';
import '/contact_us/contact_us_widget.dart';

/// Main shell with a single bottom navigation bar that switches
/// between Home, Spin, Games, and Contact tabs.
class MainBottomNavWidget extends StatelessWidget {
  MainBottomNavWidget({super.key});

  static String routeName = 'MainBottomNav';
  static String routePath = '/mainBottomNav';

  final RxInt _currentIndex =
      ((Get.arguments as Map<String, dynamic>?)?['tabIndex'] as int? ?? 0).obs;

  final List<Widget> _tabs = const <Widget>[
    HomePageDynamicWidget(),
    WheelAdventureScreenWidget(),
    OwensboroGamesWidget(),
    ContactUsWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: IndexedStack(
          index: _currentIndex.value,
          children: _tabs,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: FlutterFlowTheme.of(context).textColor,
          unselectedItemColor: FlutterFlowTheme.of(context).secondaryBackground,
          backgroundColor: FlutterFlowTheme.of(context).dashboardSelection,
          onTap: (int index) {
            if (index == _currentIndex.value) {
              return;
            }
            _currentIndex.value = index;
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.casino),
              label: 'Spins',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.games),
              label: 'Games',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.support_agent),
              label: 'Contact',
            ),
          ],
        ),
      ),
    );
  }
}
