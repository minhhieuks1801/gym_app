import 'package:flutter/material.dart';
import 'package:gym_app/common/theme/custom_theme.dart';
import 'package:gym_app/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeCustom.theme,
      title: 'GYM APP',
      home: const LoginPage()
    );
  }
}
