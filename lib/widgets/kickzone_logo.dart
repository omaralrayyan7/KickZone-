import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class KickZoneLogo extends StatelessWidget {
  final double size;
  const KickZoneLogo({super.key, this.size = 1.0});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 80 * size,
          height: 80 * size,
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.white, width: 2),
          ),
          child: Icon(
            Icons.sports_soccer,
            size: 44 * size,
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 8 * size),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Kick',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 28 * size,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
              TextSpan(
                text: 'Zone',
                style: TextStyle(
                  color: const Color(0xFFFFC107),
                  fontSize: 28 * size,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
