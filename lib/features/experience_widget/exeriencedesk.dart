import 'package:flutter/material.dart';
import 'package:raghavareddy/design/utils/app_colors.dart';

class ExperienceAndAchievementsDesktop extends StatelessWidget {
  const ExperienceAndAchievementsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Experience Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Experience",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                _experienceTile(
              title: "Technical Lead & Cultural Head",
              company: "EETA",
              duration: "November 2023 - present",
              description:
                  "Developed an application using Flutter that helped the club with its activities.",
            ),
             _experienceTile(
              title: "Software Development Intern",
              company: "Camplin",
              duration: "May 2022 - july 2022",
              description:
                  "Made an Machine Learning model using Python that helped the company",
            ),
              ],
            ),
          ),

          const SizedBox(width: 40), 

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Achievements",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                 _achievementTile(
              title: "Hackathon",
              date: "June 2023",
              description:
                  "Led a team of 4 developers to win a College level hackathon at IARE.",
            ),
                
                _achievementTile(
                  title: "Science Fair",
                  date: "June 2020",
                  description:
                      "Led a team and won the price in the science fair.",
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.purple,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            company,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            duration,
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(color: Colors.white, fontSize: 12),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.purple,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
