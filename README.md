# KickZone

## Overview
KickZone is a cross-platform mobile application built with **Flutter** for booking football (soccer) courts in Jordan. It offers a seamless experience for discovering, reserving, and paying for indoor and outdoor courts across Amman.

## App Flow
```
Sign Up / Sign In
    └─► Home Menu
            ├─► Less Kick In! ──► Court Type (Indoor / Outdoor)
            │                          └─► Court List (Jubaiba, Daboug, Abu Nasir, Abdoun, Sweich, Khalda)
            │                                   └─► Reservation (Date + Players)
            │                                           └─► Time Picker
            │                                                   └─► Payment Method
            │                                                           └─► Checkout Summary
            │                                                                   └─► Confirmation
            │                                                                           └─► My Reservations
            ├─► Need Help? ──► Help Screen
            ├─► Contact Us! ──► Contact Screen
            └─► Sign Out ──► Sign In
```

## Tech Stack
- **Framework**: Flutter (Dart)
- **State Management**: StatefulWidget + local state passing
- **Navigation**: Navigator 1.0 (push/pop)
- **Calendar**: table_calendar ^3.1.0
- **Formatting**: intl ^0.19.0
- **Storage**: shared_preferences ^2.2.2

## Design
- **Color**: Dark green theme (`#3B7A3B`) throughout
- **Currency**: Jordanian Dinars (JD)
- **Logo**: KickZone shield + football icon

## Courts
| Name | Type | JD/hr |
|------|------|-------|
| Jubaiba | Indoor | 17.5 |
| Daboug | Indoor | 17.5 |
| Abu Nasir | Indoor | 17.5 |
| Abdoun | Indoor | 20.0 |
| Sweich | Indoor | 17.5 |
| Khalda | Indoor | 17.5 |
| Sport City | Outdoor | 12.0 |
| Mecca Mall | Outdoor | 12.0 |
| Jubaiha | Outdoor | 10.0 |
| Zarqa | Outdoor | 10.0 |

## Getting Started
```bash
flutter pub get
flutter run
```
Requires Flutter SDK ≥ 3.0.0.

## Project Structure
```
lib/
├── main.dart
├── theme/app_theme.dart
├── models/
│   ├── court.dart
│   └── reservation.dart
├── screens/
│   ├── auth/sign_in_screen.dart
│   ├── auth/sign_up_screen.dart
│   ├── home/home_screen.dart
│   ├── home/court_type_screen.dart
│   ├── courts/indoor_courts_screen.dart
│   ├── courts/outdoor_courts_screen.dart
│   ├── booking/reservation_screen.dart
│   ├── booking/time_screen.dart
│   ├── booking/payment_screen.dart
│   ├── booking/checkout_screen.dart
│   ├── confirmation/confirmation_screen.dart
│   ├── confirmation/my_reservations_screen.dart
│   └── help/help_screen.dart
└── widgets/
    ├── kickzone_logo.dart
    ├── custom_button.dart
    └── court_card.dart
```
