import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/bottom_nav.dart';
import '../../models/reservation.dart';
import '../home/home_screen.dart';
import 'my_reservations_screen.dart';

class ConfirmationScreen extends StatelessWidget {
  final Reservation reservation;
  const ConfirmationScreen({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(title: const Text('Confirmation')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check_circle,
                        color: AppColors.primary, size: 56),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Your reservation has been confirmed ✓',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Thank you for choosing Kick Zone 🏆',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: AppColors.whiteMuted, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
            CustomButton(
              label: 'Home',
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
                (_) => false,
              ),
            ),
            const SizedBox(height: 14),
            OutlinedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const MyReservationsScreen()),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.white,
                side: const BorderSide(color: AppColors.white),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('My Reservations',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const KickZoneBottomNav(),
    );
  }
}
