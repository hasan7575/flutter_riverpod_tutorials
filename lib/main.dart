import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/async_home_page.dart';

void main() {
  runApp(
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Demo',
      debugShowCheckedModeBanner: false,
      home: const AsyncHomePage(),
    );
  }
}



