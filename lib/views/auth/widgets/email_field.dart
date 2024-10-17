import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogaapp/blocs/auth/register/register_event.dart';

import '../../../blocs/auth/login/login_bloc.dart';
import '../../../blocs/auth/login/login_event.dart';
import '../../../blocs/auth/login/login_state.dart';
import '../../../blocs/auth/register/register_bloc.dart';
import '../../../blocs/auth/register/register_state.dart';
import '../../../src/app_strings.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key, required this.isLogin});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: AppStrings.email,
                ),
                validator: (value) =>
                    state.isValidEmail ? null : AppStrings.isValidEmailMessage,
                onChanged: (value) => context.read<LoginBloc>().add(
                      LoginEmailChanged(email: value),
                    ),
              );
            },
          )
        : BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: AppStrings.email,
                ),
                validator: (value) =>
                    state.isValidEmail ? null : AppStrings.isValidEmailMessage,
                onChanged: (value) => context.read<RegisterBloc>().add(
                      RegisterEmailChanged(email: value),
                    ),
              );
            },
          );
  }
}
