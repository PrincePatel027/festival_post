import 'package:festival_post/screens/detail_page.dart';
import 'package:festival_post/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "poppins",
      ),
      routes: {
        '/': (context) => const HomePage(),
        'detailPage': (context) => const DetailPage(),
      },
    ),
  );
}
