import 'package:flutter/material.dart';

import '../utils/app_color.dart';

BottomNavigationBarItem buildNavItem({
  required String iconPath,
  required String label,
}) {
  return BottomNavigationBarItem(
    backgroundColor: AppColors.gold,
    icon: Image.asset(iconPath, color: Colors.black, width: 20),
    activeIcon: Container(
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(150),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Image.asset(iconPath, width: 20),
    ),
    label: label,
  );
}
