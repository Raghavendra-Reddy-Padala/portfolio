import 'package:flutter/material.dart';
import 'package:raghavareddy/design/utils/app_theme.dart';
import 'package:raghavareddy/features/home/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      title: 'Raghavendra Reddy👋 | PortFolio',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
