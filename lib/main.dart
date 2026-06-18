import 'package:flutter/material.dart';
import 'screens/auth/sign_in_screen.dart';
import 'theme/app_theme.dart';

void main() => runApp(const KickZoneApp());

class KickZoneApp extends StatelessWidget {
  const KickZoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KickZone',
      theme: AppTheme.theme,
      home: const SignInScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
