import 'package:flutter/material.dart';
import 'package:raghavareddy/design/utils/app_colors.dart';
import 'package:social_media_flutter/social_media_flutter.dart';
import 'dart:html' as html;

import 'package:url_launcher/url_launcher.dart';

class ContactUsDesktopWidget extends StatelessWidget {
  const ContactUsDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Get in Touch',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.purple,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: AppColors.violet.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.purple.withOpacity(0.3)),
            ),
            child: Column(
              children: [
                const Text(
                  "Let's collaborate on your next project! Feel free to reach out through any of these channels:",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _contactItem(
                      icon: Icons.email,
                      title: 'Email',
                      content: 'raghavareddy696969@gmail.com',
                      onTap: () => _launchEmail('raghavareddy696969@gmail.com'),
                    ),
                    const SizedBox(width: 40),
                    _contactItem(
                      icon: Icons.phone,
                      title: 'Phone',
                      content: '+91 9032323095',
                      onTap: () => _launchPhone('+911234567890'),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socialIcon('https://www.linkedin.com/in/raghavendra-reddy-padala-28bbb6256', SocialIconsFlutter.linkedin_box),
                    const SizedBox(width: 20),
                    socialIcon('https://github.com/Raghavendra-Reddy-Padala', SocialIconsFlutter.github),
                    const SizedBox(width: 20),
                    socialIcon('https://www.instagram.com/mr_reddy369_/?__pwa=1', SocialIconsFlutter.instagram),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),
          const Text(
            'Coded by P Raghavendra Reddy with 💚',
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _contactItem({required IconData icon, required String title, required String content, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.violet.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.purple, size: 36),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(content, style: const TextStyle(fontSize: 16, color: Colors.white70)),
          ],
        ),
      ),
    );
  }

  Widget socialIcon(String link, IconData iconPath) {
    return InkWell(
      onTap: () => html.window.open(link, '_blank'),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.violet.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: SocialWidget(
          placeholderText: '',
          iconData: iconPath,
          iconColor: AppColors.purple,
          iconSize: 30,
          link: link,
        ),
      ),
    );
  }

  void _launchEmail(String email) {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    launchUrl(emailLaunchUri);
  }

  void _launchPhone(String phoneNumber) {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    launchUrl(phoneLaunchUri);
  }
}

