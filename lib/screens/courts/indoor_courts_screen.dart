import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/court_card.dart';
import '../../widgets/bottom_nav.dart';
import '../../models/court.dart';
import '../booking/reservation_screen.dart';

class IndoorCourtsScreen extends StatelessWidget {
  const IndoorCourtsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(title: const Text('Indoor Courts')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: Court.indoorCourts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, i) {
            final court = Court.indoorCourts[i];
            return CourtCard(
              court: court,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ReservationScreen(court: court)),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const KickZoneBottomNav(),
    );
  }
}
