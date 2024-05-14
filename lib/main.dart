import 'package:festival_post/screens/detail_page.dart';
import 'package:festival_post/screens/home_page.dart';
import 'package:festival_post/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "poppins",
      ),
      initialRoute: "splash",
      routes: {
        '/': (context) => const HomePage(),
        'splash': (context) => const SplashScreen(),
        'detailPage': (context) => const DetailPage(),
      },
    ),
  );
}
