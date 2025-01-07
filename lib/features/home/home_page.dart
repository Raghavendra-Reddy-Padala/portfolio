import 'package:flutter/material.dart';
import 'package:raghavareddy/features/certifications/certiwidget.dart';
import 'package:raghavareddy/features/contact_us/ui/contact_us_widget.dart';
import 'package:raghavareddy/features/experience_widget/expwidget.dart';
import 'package:raghavareddy/features/intro/ui/intro_widget.dart';
import 'package:raghavareddy/features/navbar/navbar_widget.dart';
import 'package:raghavareddy/features/navbar/ui/mobile/navbar_mobile_widget.dart';
import 'package:raghavareddy/features/projectss/portfolio_widget.dart';
import 'package:raghavareddy/features/techstack/ui/techstack_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(6, (_) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      appBar: isMobile
          ? PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: NavBarMobileWidget(
                scrollController: _scrollController,
                sectionKeys: _sectionKeys,
              ),
            )
          : null,
      drawer: isMobile
          ? NavDrawer(
              scrollController: _scrollController,
              sectionKeys: _sectionKeys,
            )
          : null,
      body: Column(
        children: [
          if (!isMobile)
            NavBarWidget(
              scrollController: _scrollController,
              sectionKeys: _sectionKeys,
              isMobile: isMobile,
            ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IntroWidget(key: _sectionKeys[0]),
                    TechStackWidget(key: _sectionKeys[1]),
                    ResponsivePortfolioWidget(key: _sectionKeys[2]),
                    ExperienceAndAchievementsWidget(key: _sectionKeys[3]),
                    CertificationWidget(key: _sectionKeys[4]),
                    ContactUsWidget(key: _sectionKeys[5]),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

