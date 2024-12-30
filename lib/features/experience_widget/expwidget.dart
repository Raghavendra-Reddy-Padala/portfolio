import 'package:flutter/material.dart';
import 'package:raghavareddy/features/experience_widget/exeriencedesk.dart';
import 'package:raghavareddy/features/experience_widget/experiencemobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ExperienceAndAchievementsWidget extends StatelessWidget {
  const ExperienceAndAchievementsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (context) => const ExperienceAndAchievementsDesktop(),
      tablet: (context) => const ExperienceAndAchievementsMobile(),
      mobile: (context) => const ExperienceAndAchievementsMobile(),
    );
  }
}
