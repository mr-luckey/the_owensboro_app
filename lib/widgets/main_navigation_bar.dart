import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/pages/main_bottom_nav/main_bottom_nav_widget.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({
    super.key,
    this.currentIndex = 0,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: FlutterFlowTheme.of(context).textColor,
      unselectedItemColor: FlutterFlowTheme.of(context).secondaryBackground,
      backgroundColor: FlutterFlowTheme.of(context).dashboardSelection,
      onTap: (int index) {
        // Always route through the main shell so tabs switch in-place.
        Get.offNamed(
          MainBottomNavWidget.routePath,
          arguments: <String, dynamic>{'tabIndex': index},
        );
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.casino),
          label: 'Spin',
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
    );
  }
}
