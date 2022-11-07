import 'dart:async';
import 'package:app_emi/initial.dart';
import 'package:app_emi/providers/signInProvider.dart';
import 'package:app_emi/screens/auth/login.dart';
import 'package:app_emi/utils/config.dart';
import 'package:app_emi/utils/nextScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final splash = context.read<SignInProvaider>();
    super.initState();

    Timer(const Duration(seconds: 3), () {
      splash.isSignedIn == false
          ? nextScreen(context, const Login())
          : nextScreen(context, const Initial());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Center(
        child: Image(
          image: AssetImage(Config.appLogo),
        ),
      )),
    );
  }
}
