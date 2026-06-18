import 'package:flutter/material.dart';
import 'court.dart';

class Reservation {
  final String id;
  final Court court;
  final DateTime date;
  final TimeOfDay time;
  final int durationHours;
  final int players;
  final String paymentMethod;

  const Reservation({
    required this.id,
    required this.court,
    required this.date,
    required this.time,
    required this.durationHours,
    required this.players,
    required this.paymentMethod,
  });

  double get totalPrice => court.pricePerHour * durationHours;

  String get formattedDate =>
      '\${date.day}/\${date.month}/\${date.year}';

  String get formattedTime {
    final h = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final m = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '\$h:\$m \$period';
  }
}

/// Simple in-memory store – survives the session.
class ReservationStore {
  static final List<Reservation> _list = [];
  static List<Reservation> get all => List.unmodifiable(_list);
  static void add(Reservation r) => _list.add(r);
}
