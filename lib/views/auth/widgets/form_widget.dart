import 'package:flutter/material.dart';
import 'package:yogaapp/views/auth/widgets/password_field.dart';

import '../../../src/app_colors.dart';
import 'auth_button.dart';
import 'email_field.dart';

class FormWidget extends StatelessWidget {
  FormWidget({super.key, required this.isLogin});

  final dynamic _formKey = GlobalKey<FormState>();
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            EmailField(isLogin: isLogin),
            PasswordField(isLogin: isLogin),
            const SizedBox(
              height: 15,
            ),
            AuthButton(
              formKey: _formKey,
              isLogin: isLogin,
            ),
          ],
        ),
      ),
    );
  }
}
