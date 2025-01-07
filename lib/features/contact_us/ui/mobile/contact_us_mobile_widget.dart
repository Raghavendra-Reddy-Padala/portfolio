import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:raghavareddy/design/utils/app_colors.dart';
import 'package:social_media_flutter/widgets/icons.dart';
import 'dart:html' as html;

class ContactMobileWidget extends StatelessWidget {
  const ContactMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.white, Colors.white],
            ).createShader(bounds),
            child: _buildSectionHeader("Let's connect ", Icons.connect_without_contact_outlined)
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3),


          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.purple.withOpacity(0.1),
                  Colors.blue.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.purple.withOpacity(0.3),
              ),
            ),
            child: Column(
              children: [
                const Text(
                  "I'm always open to discussing new projects, creative ideas, or opportunities to be part of your visions.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 20),
                _buildContactItem(
                  Icons.email,
                  "Email Me At",
                  "raghavareddy696969@gmail.com",
                ),
              ],
            ),
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.3),

          const SizedBox(height: 40),

          Column(
            children: [
              const Text(
                "Find Me On",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(
                    "GitHub",
                    SocialIconsFlutter.github,
                    'https://github.com/Raghavendra-Reddy-Padala',
                  ),
                  const SizedBox(width: 20),
                  _buildSocialButton(
                    "LinkedIn",
                    SocialIconsFlutter.linkedin_box,
                    'https://www.linkedin.com/in/raghavendra-reddy-padala-28bbb6256',
                  ),
                  const SizedBox(width: 20),
                  _buildSocialButton(
                    "Instagram",
                    SocialIconsFlutter.instagram,
                    'https://www.instagram.com/mr_reddy369_/',
                  ),
                ],
              ),
            ],
          ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.3),

          const SizedBox(height: 60),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColors.purple.withOpacity(0.3),
                ),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "Coded by P Raghavendra Reddy",
                  style: TextStyle(
                    color: AppColors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "with 💚",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 600.ms),
        ],
      ),
    );
  }
Widget _buildSectionHeader(String title, IconData icon) {
    return   Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.violet.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: AppColors.violet.withOpacity(0.2),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: AppColors.purple,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
  Widget _buildContactItem(IconData icon, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: AppColors.purple),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                color: AppColors.purple,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton(String label, IconData icon, String link) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => html.window.open(link, '_blank'),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.purple.withOpacity(0.2),
                Colors.blue.withOpacity(0.2),
              ],
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.purple.withOpacity(0.3),
            ),
          ),
          child: Column(
            children: [
              Icon(icon, color: Colors.white, size: 24),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

