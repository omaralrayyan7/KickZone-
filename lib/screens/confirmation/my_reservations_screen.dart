import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/bottom_nav.dart';
import '../../models/reservation.dart';
import '../home/home_screen.dart';

class MyReservationsScreen extends StatelessWidget {
  const MyReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reservations = ReservationStore.all;

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(title: const Text('My Reservations')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'No. of reservations: \${reservations.length}',
                style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: reservations.isEmpty
                  ? const Center(
                      child: Text('No reservations yet',
                          style: TextStyle(
                              color: AppColors.whiteMuted, fontSize: 16)))
                  : ListView.builder(
                      itemCount: reservations.length,
                      itemBuilder: (_, i) =>
                          _reservationCard(reservations[i], i + 1),
                    ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Expanded(child: Divider(color: Colors.white38)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('There are no more reservations',
                        style:
                            TextStyle(color: Colors.white54, fontSize: 12)),
                  ),
                  Expanded(child: Divider(color: Colors.white38)),
                ],
              ),
            ),
            CustomButton(
              label: 'Home',
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
                (_) => false,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const KickZoneBottomNav(),
    );
  }

  Widget _reservationCard(Reservation r, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Reservation #\$index',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  fontSize: 14)),
          const SizedBox(height: 8),
          _detail(Icons.sports_soccer, '\${r.court.type} Court – \${r.court.name}'),
          _detail(Icons.calendar_today, r.formattedDate),
          _detail(Icons.access_time, '\${r.formattedTime} (\${r.durationHours} hrs)'),
          _detail(Icons.people, '\${r.players} players'),
          _detail(Icons.payment, r.paymentMethod),
        ],
      ),
    );
  }

  Widget _detail(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Icon(icon, size: 15, color: AppColors.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text,
                style: const TextStyle(
                    color: AppColors.textDark, fontSize: 13)),
          ),
        ],
      ),
    );
  }
}
