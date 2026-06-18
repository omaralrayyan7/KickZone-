import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/kickzone_logo.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/bottom_nav.dart';
import '../home/home_screen.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  void _signIn() {
    if (_emailCtrl.text.isEmpty || _passCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            child: Column(
              children: [
                const KickZoneLogo(),
                const SizedBox(height: 36),
                _card(),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const SignUpScreen())),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Create new account? ',
                      style: TextStyle(color: AppColors.white),
                      children: [
                        TextSpan(
                          text: 'Sign Up!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: AppColors.white),
                        ),
                      ],
                    ),
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

  Widget _card() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          const Text('Sign in!',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white)),
          const SizedBox(height: 22),
          _field(controller: _emailCtrl, hint: 'Email Address',
              icon: Icons.email_outlined, type: TextInputType.emailAddress),
          const SizedBox(height: 14),
          _field(controller: _passCtrl, hint: '••••••••••••',
              icon: Icons.lock_outline, obscure: true),
          const SizedBox(height: 22),
          CustomButton(label: 'Sign in', onPressed: _signIn),
        ],
      ),
    );
  }

  Widget _field({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscure = false,
    TextInputType? type,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      keyboardType: type,
      style: const TextStyle(color: AppColors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
        prefixIcon: Icon(icon, color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
