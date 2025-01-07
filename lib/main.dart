import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:raghavareddy/design/utils/app_theme.dart';
import 'package:raghavareddy/features/home/home_page.dart';
import 'package:raghavareddy/firebase_options.dart';


void main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform
);
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
