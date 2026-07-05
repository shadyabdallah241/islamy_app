import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/image_paths.dart';
import '../widgets/bottom_nav_item.dart';

class AppBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const AppBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: .shifting,
      selectedItemColor: Colors.white,
      currentIndex: selectedIndex,
      backgroundColor: AppColors.gold,
      onTap: onTap,
      items: [
        buildNavItem(iconPath: AppImagePaths.quranIcon, label: "Quran"),
        buildNavItem(iconPath: AppImagePaths.hadethIcon, label: "Hadeeth"),
        buildNavItem(iconPath: AppImagePaths.sebhaIcon, label: "Sebha"),
        buildNavItem(iconPath: AppImagePaths.radioIcon, label: "Radio"),
        buildNavItem(iconPath: AppImagePaths.timeIcon, label: "Time"),
      ],
    );
  }
}
