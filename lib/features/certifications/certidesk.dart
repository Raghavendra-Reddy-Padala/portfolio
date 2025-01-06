import 'package:flutter/material.dart';
import 'package:raghavareddy/design/utils/app_colors.dart';
import 'package:raghavareddy/design/widgets/buttons/app_outlined_button.dart';
import 'package:url_launcher/url_launcher.dart';

class CertificationDesktopWidget extends StatelessWidget {
  const CertificationDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Certifications-(Yet to be updated)",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 40,
              mainAxisSpacing: 20,
              childAspectRatio: 3,
            ),
            itemCount: certifications.length,
            itemBuilder: (context, index) {
              final certification = certifications[index];
              return _certificationCard(
                title: certification['title']!,
                issuer: certification['issuer']!,
                date: certification['date']!,
                link: certification['link']!,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _certificationCard({
    required String title,
    required String issuer,
    required String date,
    required String link,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.purple,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.purple, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            issuer,
            style: const TextStyle(fontSize: 14, color: Colors.white70),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: const TextStyle(fontSize: 12, color: Colors.white54),
          ),
          const SizedBox(height: 16),
          AppOutlinedButton(
            title: "View Certification",
            onTap: () => _openLink(link),
          ),
        ],
      ),
    );
  }

  void _openLink(String link) {
    launchUrl(Uri.parse(link));
  }
}

final certifications = [
  {
    "title": "Flutter Developer Certification",
    "issuer": "Google",
    "date": "June 2023",
    "link": "https://flutter.dev/certification"
  },
  {
    "title": "AWS Cloud Practitioner",
    "issuer": "Amazon Web Services",
    "date": "May 2022",
    "link": "https://aws.amazon.com/certification/"
  },
  {
    "title": "Full-Stack Web Development",
    "issuer": "Udemy",
    "date": "March 2023",
    "link": "https://www.udemy.com/certificate/"
  },
  {
    "title": "Machine Learning Fundamentals",
    "issuer": "Coursera",
    "date": "February 2023",
    "link": "https://www.coursera.org/certificates/"
  },
];
