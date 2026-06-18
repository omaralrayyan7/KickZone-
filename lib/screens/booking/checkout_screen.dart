import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/bottom_nav.dart';
import '../../models/court.dart';
import '../../models/reservation.dart';
import '../confirmation/confirmation_screen.dart';

class CheckoutScreen extends StatelessWidget {
  final Court court;
  final DateTime date;
  final int players;
  final TimeOfDay time;
  final int durationHours;
  final String paymentMethod;

  const CheckoutScreen({
    super.key,
    required this.court,
    required this.date,
    required this.players,
    required this.time,
    required this.durationHours,
    required this.paymentMethod,
  });

  String get _formattedDate => '\${date.day}/\${date.month}/\${date.year}';

  String get _formattedTime {
    final h = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final m = time.minute.toString().padLeft(2, '0');
    final p = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '\$h:\$m \$p';
  }

  double get _total => court.pricePerHour * durationHours;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark)),
                      Text('JD \${_total.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary)),
                    ],
                  ),
                  const Divider(height: 24),
                  _row('Court type',
                      '\${court.type[0].toUpperCase()}\${court.type.substring(1)} Court'),
                  _row('Location', court.name),
                  _row('Date', _formattedDate),
                  _row('Duration', '\$durationHours hrs'),
                  _row('Players', '\$players people'),
                  _row('Start time', _formattedTime),
                  _row('Payment', paymentMethod),
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
              label: 'Pay',
              onPressed: () {
                final reservation = Reservation(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  court: court,
                  date: date,
                  time: time,
                  durationHours: durationHours,
                  players: players,
                  paymentMethod: paymentMethod,
                );
                ReservationStore.add(reservation);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        ConfirmationScreen(reservation: reservation),
                  ),
                  (route) => route.isFirst,
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const KickZoneBottomNav(),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          const Icon(Icons.circle, size: 8, color: AppColors.primary),
          const SizedBox(width: 10),
          Text('\$label: ',
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: AppColors.textDark)),
          Expanded(
              child: Text(value,
                  style: const TextStyle(color: AppColors.textMuted))),
        ],
      ),
    );
  }
}
