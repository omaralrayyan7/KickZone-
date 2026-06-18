import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class KickZoneBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const KickZoneBottomNav({
    super.key,
    this.currentIndex = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      color: AppColors.primaryDark,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navIcon(Icons.sports, 0),
          _navIcon(Icons.stadium, 1),
          _navIcon(Icons.sports_soccer, 2),
        ],
      ),
    );
  }

  Widget _navIcon(IconData icon, int index) {
    final isActive = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap?.call(index),
      child: Icon(
        icon,
        color: isActive ? Colors.white : Colors.white54,
        size: 28,
      ),
    );
  }
}
