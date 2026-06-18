import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/kickzone_logo.dart';
import '../../widgets/bottom_nav.dart';
import '../home/court_type_screen.dart';
import '../help/help_screen.dart';
import '../auth/sign_in_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const KickZoneLogo(),
                const SizedBox(height: 48),
                _menuItem(
                  icon: Icons.sports_soccer,
                  label: 'Less Kick In!',
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const CourtTypeScreen())),
                ),
                const SizedBox(height: 16),
                _menuItem(
                  icon: Icons.help_outline,
                  label: 'Need Help?',
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const HelpScreen())),
                ),
                const SizedBox(height: 16),
                _menuItem(
                  icon: Icons.contact_support_outlined,
                  label: 'Contact Us!',
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const HelpScreen())),
                ),
                const SizedBox(height: 16),
                _menuItem(
                  icon: Icons.logout,
                  label: 'Sign out',
                  onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const SignInScreen()),
                    (_) => false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const KickZoneBottomNav(),
    );
  }

  Widget _menuItem(
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return Material(
      color: Colors.white.withOpacity(0.18),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Row(
            children: [
              Icon(icon, color: AppColors.white, size: 26),
              const SizedBox(width: 16),
              Expanded(
                child: Text(label,
                    style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ),
              const Icon(Icons.chevron_right, color: Colors.white54),
            ],
          ),
        ),
      ),
    );
  }
}
