import 'package:flutter/material.dart';

import '../../../src/app_strings.dart';
import '../login/login_screen.dart';
import '../register/register_screen.dart';

class HaveAccountText extends StatelessWidget {
  const HaveAccountText({super.key, required this.isLogin});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLogin ? () => _goToRegister(context) : () => _goToLogin(context),
      child: Text(isLogin ? AppStrings.haventAccount : AppStrings.haveAccount),
    );
  }

  void _goToRegister(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const RegisterScreen()),
        (route) => false);
  }

  void _goToLogin(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }
}
