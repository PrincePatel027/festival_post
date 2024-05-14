import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 3), (timer) {
      Navigator.of(context).pushReplacementNamed("/");
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF339F74),
      body: Center(
        child: Text(
          "Festival Post",
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}
