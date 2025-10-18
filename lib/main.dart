import 'package:flutter/material.dart';
import 'package:flutter_tutorials/pages/clean_login_screen.dart';
import 'pages/messy_login_screen.dart';
// import 'pages/clean_login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Code Tutorial',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const CleanLoginScreen(),
    );
  }
}
