// Flutter Material Design imports for UI components
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorials/home_page.dart';


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
      home: HomePage(),
      // HomePage will be a ConsumerWidget since it needs to access providers
    );
  }
}



