import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/pages/home_page_dynamic/home_page_dynamic_widget.dart';
import '/pages/wheel_adventure_screen/wheel_adventure_screen_widget.dart';
import '/owensboro_games/owensboro_games_widget.dart';
import '/contact_us/contact_us_widget.dart';

import 'controller/main_bottom_nav_controller.dart';

/// Main shell with a single bottom navigation bar that switches
/// between Home, Spin, Games, and Contact tabs.
class MainBottomNavWidget extends GetView<MainBottomNavController> {
  const MainBottomNavWidget({super.key});

  static String routeName = 'MainBottomNav';
  static String routePath = '/mainBottomNav';

  static final List<Widget> _tabs = <Widget>[
    const HomePageDynamicWidget(),
    const WheelAdventureScreenWidget(),
    const OwensboroGamesWidget(),
    const ContactUsWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: _tabs,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: FlutterFlowTheme.of(context).textColor,
          unselectedItemColor: FlutterFlowTheme.of(context).secondaryBackground,
          backgroundColor: FlutterFlowTheme.of(context).dashboardSelection,
          onTap: controller.onTabTapped,
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
