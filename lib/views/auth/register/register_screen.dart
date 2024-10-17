import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth/register/register_bloc.dart';
import '../../../blocs/auth/register/register_state.dart';
import '../../../blocs/bloc_status.dart';
import '../../../network/repository/repository_store.dart';
import '../../../src/app_assets.dart';
import '../../../src/app_colors.dart';
import '../../welcome/welcome_screen.dart';
import '../widgets/form_widget.dart';
import '../widgets/have_account_text.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageColor,
      body: BlocProvider(
        create: (context) =>
            RegisterBloc(authRepo: RepositoryStore.authRepository),
        child: BlocListener<RegisterBloc, RegisterState>(
          listenWhen: (previous, current) =>
              previous.appStatus != current.appStatus,
          listener: (context, state) {
            final formStatus = state.appStatus;

            if (formStatus is SubmissionFailed) {
              _showSnackBar(context, formStatus.exception.toString());
            }

            if (formStatus is SubmissionSuccess) {
              _goToWelcome(context);
            }
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AppAssets.yoga),
                    FormWidget(isLogin: false),
                    const SizedBox(height: 10),
                    const HaveAccountText(isLogin: false),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _goToWelcome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        (route) => false);
  }
}
