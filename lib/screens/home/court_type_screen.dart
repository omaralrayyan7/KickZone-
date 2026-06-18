import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/kickzone_logo.dart';
import '../../widgets/bottom_nav.dart';
import '../courts/indoor_courts_screen.dart';
import '../courts/outdoor_courts_screen.dart';

class CourtTypeScreen extends StatelessWidget {
  const CourtTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(title: const Text('Select Court Type')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(child: KickZoneLogo(size: 0.75)),
            const SizedBox(height: 32),
            Expanded(
              child: _typeCard(
                context,
                label: 'Indoor Courts',
                imageUrl:
                    'https://images.unsplash.com/photo-1551698618-1dfe5d97d256?w=800&fit=crop',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const IndoorCourtsScreen())),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _typeCard(
                context,
                label: 'Outdoor Courts',
                imageUrl:
                    'https://images.unsplash.com/photo-1459865264687-595d652de67e?w=800&fit=crop',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(
                        builder: (_) => const OutdoorCourtsScreen())),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const KickZoneBottomNav(),
    );
  }

  Widget _typeCard(BuildContext context,
      {required String label,
      required String imageUrl,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primaryDark,
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      Container(color: AppColors.primaryDark)),
            ),
            Positioned.fill(
              child: Container(
                  color: Colors.black.withOpacity(0.35)),
            ),
            Center(
              child: Text(label,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
