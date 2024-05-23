import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:wifipos_web/presentation/pages/home_page.dart';
import 'package:wifipos_web/presentation/pages/landing_page.dart';

import '../../data/datasources/auth_local_datasource.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 3));
    final isLoggedIn = await AuthLocalDatasource().isLogin();
    log("User isLogin : $isLoggedIn");
    if (isLoggedIn) {
      _navigateToHomePage();
    } else {
      _navigateToLandingPage();
    }
  }

  void _navigateToHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  void _navigateToLandingPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LandingPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_wipos.png',
            ),
          ],
        ),
      ),
    );
  }
}
