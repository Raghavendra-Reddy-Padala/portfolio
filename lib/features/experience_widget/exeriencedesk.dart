import 'package:flutter/material.dart';
import 'package:raghavareddy/design/utils/app_colors.dart';

class ExperienceAndAchievementsDesktop extends StatelessWidget {
  const ExperienceAndAchievementsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 40.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Experience",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.purple,
                  ),
                ),
                const SizedBox(height: 30),
                _experienceTile(
                  title: "Technical Lead & Cultural Head",
                  company: "EETA",
                  duration: "November 2024 - present",
                  description: "Developed an application using Flutter that helped the club with its activities.",
                ),
                _experienceTile(
                  title: "Machine Learning Intern",
                  company: "Camplin",
                  duration: "May 2022 - July 2022",
                  description: "Made a Machine Learning model using Python that helped the company.",
                ),
              ],
            ),
          ),
          const SizedBox(width: 60),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Achievements",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.purple,
                  ),
                ),
                const SizedBox(height: 30),
                _achievementTile(
                  title: "Hackathon Winner",
                  date: "June 2023",
                  description: "Led a team of 4 developers to win a College level hackathon at IARE.",
                ),
                _achievementTile(
                  title: "Science Fair Winner",
                  date: "June 2020",
                  description: "Led a team and won the prize in the science fair.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _experienceTile({
    required String title,
    required String company,
    required String duration,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.violet.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.purple.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            company,
            style: TextStyle(color: AppColors.purple, fontSize: 18),
          ),
          const SizedBox(height: 4),
          Text(
            duration,
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _achievementTile({
    required String title,
    required String date,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.violet.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.purple.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            date,
            style: TextStyle(color: AppColors.purple, fontSize: 18),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
