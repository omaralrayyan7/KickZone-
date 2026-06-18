import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/bottom_nav.dart';
import '../home/home_screen.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(title: const Text('Need Help?')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Contact us via:',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _contactCard(
              icon: Icons.phone,
              label: 'Tel',
              value: '00962 79 0550 787',
              onTap: () => _launch('tel:00962790550787'),
            ),
            const SizedBox(height: 12),
            _contactCard(
              icon: Icons.email,
              label: 'Email',
              value: 'kickzone@gmail.com',
              onTap: () => _launch('mailto:kickzone@gmail.com'),
            ),
            const SizedBox(height: 12),
            _contactCard(
              icon: Icons.camera_alt,
              label: 'Instagram',
              value: '@kick.zone',
              onTap: () => _launch('https://instagram.com/kick.zone'),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'For instant help, call us during working hours\n(9 AM – 10 PM)',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.whiteMuted, fontSize: 13),
              ),
            ),
            const Spacer(),
            const Text(
              'Hope we could help you! 😊',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.whiteMuted, fontSize: 14),
            ),
            const SizedBox(height: 16),
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

  Widget _contactCard({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary, size: 24),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(
                        color: AppColors.textMuted, fontSize: 12)),
                Text(value,
                    style: const TextStyle(
                        color: AppColors.textDark,
                        fontWeight: FontWeight.w600,
                        fontSize: 15)),
              ],
            ),
            const Spacer(),
            const Icon(Icons.open_in_new, color: AppColors.textMuted, size: 18),
          ],
        ),
      ),
    );
  }
}
