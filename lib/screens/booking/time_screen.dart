import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/bottom_nav.dart';
import '../../models/court.dart';
import 'payment_screen.dart';

class TimeScreen extends StatefulWidget {
  final Court court;
  final DateTime date;
  final int players;

  const TimeScreen({
    super.key,
    required this.court,
    required this.date,
    required this.players,
  });

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  TimeOfDay _time = const TimeOfDay(hour: 20, minute: 0);
  int _duration = 2; // hours

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _time,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: AppColors.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) setState(() => _time = picked);
  }

  @override
  Widget build(BuildContext context) {
    final h = _time.hourOfPeriod == 0 ? 12 : _time.hourOfPeriod;
    final m = _time.minute.toString().padLeft(2, '0');
    final period = _time.period == DayPeriod.am ? 'AM' : 'PM';

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(title: const Text('Reservation')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select reservation time',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: _pickTime,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 28),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Text(
                      '\$h:\$m',
                      style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 56,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      period,
                      style: const TextStyle(
                          color: AppColors.white, fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    const Text('Tap to change',
                        style: TextStyle(color: Colors.white54, fontSize: 13)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Duration (hours)',
                      style: TextStyle(
                          color: AppColors.white, fontSize: 15)),
                  Row(
                    children: [
                      _btn(Icons.remove,
                          () => setState(() { if (_duration > 1) _duration--; })),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text('\$_duration',
                            style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      _btn(Icons.add,
                          () => setState(() => _duration++)),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
              label: 'Continue',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PaymentScreen(
                    court: widget.court,
                    date: widget.date,
                    players: widget.players,
                    time: _time,
                    durationHours: _duration,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const KickZoneBottomNav(),
    );
  }

  Widget _btn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32, height: 32,
        decoration: BoxDecoration(
          color: AppColors.primaryDark,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppColors.white, size: 18),
      ),
    );
  }
}
