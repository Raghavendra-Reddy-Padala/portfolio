import 'package:flutter/material.dart';
import 'package:raghavareddy/design/utils/app_colors.dart';
import 'package:raghavareddy/design/widgets/buttons/app_outlined_button.dart';
import 'package:raghavareddy/features/certifications/certidesk.dart';
import 'package:url_launcher/url_launcher.dart';

class CertificationMobileWidget extends StatelessWidget {
  const CertificationMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Certifications",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: certifications.length,
            itemBuilder: (context, index) {
              final certification = certifications[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: _certificationCard(
                  title: certification['title']!,
                  issuer: certification['issuer']!,
                  date: certification['date']!,
                  link: certification['link']!,
                ),
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
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
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
