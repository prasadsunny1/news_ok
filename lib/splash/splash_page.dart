import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_ok/app/router/router_constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 1000), () {
      Navigator.pushReplacementNamed(
          context,
          FirebaseAuth.instance.currentUser != null
              ? RouterConstants.homePage
              : RouterConstants.loginPage);
    });
    return const Scaffold(
      body: Center(
        child: Text('Splash Page'),
      ),
    );
  }
}
