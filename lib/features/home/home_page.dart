import 'package:flutter/material.dart';
import 'package:raghavareddy/features/certifications/certiwidget.dart';
import 'package:raghavareddy/features/ui/contact_us_widget.dart';
import 'package:raghavareddy/features/experience_widget/expwidget.dart';
import 'package:raghavareddy/features/intro/ui/intro_widget.dart';
import 'package:raghavareddy/features/navbar/navbar_widget.dart';
import 'package:raghavareddy/features/projectss/portfolio_widget.dart';
import 'package:raghavareddy/features/techstack/ui/techstack_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          NavBarWidget(),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IntroWidget(),
                  TechStackWidget(),
                  ResponsivePortfolioWidget(),
                  ExperienceAndAchievementsWidget(),
                  CertificationWidget(),
                  ContactUsWidget()
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
