import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/bottom_nav.dart';
import '../../models/court.dart';
import 'checkout_screen.dart';

class PaymentScreen extends StatefulWidget {
  final Court court;
  final DateTime date;
  final int players;
  final TimeOfDay time;
  final int durationHours;

  const PaymentScreen({
    super.key,
    required this.court,
    required this.date,
    required this.players,
    required this.time,
    required this.durationHours,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selected = 'Visa / Mastercard';

  static const _methods = ['Visa / Mastercard', 'Apple Pay', 'Cash'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(title: const Text('Payment')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select payment method',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: _methods
                    .map((m) => RadioListTile<String>(
                          title: Text(m,
                              style: const TextStyle(
                                  color: AppColors.textDark,
                                  fontWeight: FontWeight.w500)),
                          value: m,
                          groupValue: _selected,
                          activeColor: AppColors.primary,
                          onChanged: (v) => setState(() => _selected = v!),
                        ))
                    .toList(),
              ),
            ),
            const Spacer(),
            CustomButton(
              label: 'Continue',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CheckoutScreen(
                    court: widget.court,
                    date: widget.date,
                    players: widget.players,
                    time: widget.time,
                    durationHours: widget.durationHours,
                    paymentMethod: _selected,
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
}
