import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogaapp/blocs/auth/login/login_bloc.dart';
import 'package:yogaapp/blocs/auth/register/register_bloc.dart';
import 'package:yogaapp/blocs/home/home_bloc.dart';
import 'package:yogaapp/src/app_colors.dart';
import 'package:yogaapp/views/welcome/welcome_screen.dart';

import 'firebase_options.dart';
import 'network/repository/repository_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    appleProvider: AppleProvider.debug,
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    // Set androidProvider to `AndroidProvider.debug`
    androidProvider: AndroidProvider.debug,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
            create: (_) => LoginBloc(authRepo: RepositoryStore.authRepository)),
        BlocProvider<RegisterBloc>(
            create: (context) =>
                RegisterBloc(authRepo: RepositoryStore.authRepository)),
        BlocProvider<HomeBloc>(
            create: (context) =>
                HomeBloc(homeRepo: RepositoryStore.homeRepository)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          primarySwatch: AppColors.primarySwatch,
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
