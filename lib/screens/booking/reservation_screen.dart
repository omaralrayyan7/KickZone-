import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/bottom_nav.dart';
import '../../models/court.dart';
import 'time_screen.dart';

class ReservationScreen extends StatefulWidget {
  final Court court;
  const ReservationScreen({super.key, required this.court});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  int _players = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: const Text('Reservation'),
        subtitle: Text(
          widget.court.name,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select reservation slot',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: TableCalendar(
                firstDay: DateTime.now(),
                lastDay: DateTime.now().add(const Duration(days: 365)),
                focusedDay: _focusedDay,
                selectedDayPredicate: (d) => isSameDay(d, _selectedDay),
                onDaySelected: (selected, focused) {
                  setState(() {
                    _selectedDay = selected;
                    _focusedDay = focused;
                  });
                },
                calendarStyle: CalendarStyle(
                  selectedDecoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
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
                  const Text('Number of players',
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                  Row(
                    children: [
                      _counterBtn(Icons.remove, () {
                        if (_players > 1) setState(() => _players--);
                      }),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text('\$_players',
                            style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      _counterBtn(Icons.add, () => setState(() => _players++)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            CustomButton(
              label: 'Continue',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TimeScreen(
                    court: widget.court,
                    date: _selectedDay,
                    players: _players,
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

  Widget _counterBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: AppColors.primaryDark,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppColors.white, size: 18),
      ),
    );
  }
}
