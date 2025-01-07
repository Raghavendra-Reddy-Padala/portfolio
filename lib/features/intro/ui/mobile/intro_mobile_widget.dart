import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:raghavareddy/design/constants/app_images.dart';
import 'package:raghavareddy/design/utils/app_colors.dart';
import 'package:social_media_flutter/widgets/icons.dart';
import 'dart:html' as html;
class IntroMobileWidget extends StatelessWidget {
  const IntroMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 600),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.bgColor,
            AppColors.bgColor.withOpacity(0.8),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          // Enhanced background animation

          AnimatedPositioned(
            duration: const Duration(seconds: 20),
            curve: Curves.easeInOut,
            top: -50,
            right: -50,
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.2, end: 0.8),
              duration: const Duration(seconds: 4),
              builder: (context, double value, child) {
                return Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.purple.withOpacity(value),
                        AppColors.purple.withOpacity(value),
                      ],
                      center: Alignment.center,
                      radius: 1.0,
                    ),
                  ),
                );
              },
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 20),
            curve: Curves.easeInOut,
            top: -50,
            left: -50,
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.2, end: 0.8),
              duration: const Duration(seconds: 4),
              builder: (context, double value, child) {
                return Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.purple.withOpacity(value),
                        AppColors.purple.withOpacity(value),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Hero(
                    tag: 'profile',
                    child: TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.elasticOut,
                      builder: (context, double value, child) {
                        return Transform.scale(
                          scale: value,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: SweepGradient(
                                colors: [
                                  AppColors.purple,
                                  Colors.blue.shade400,
                                  AppColors.purple,
                                ],
                              ),
                            ),
                            child: const CircleAvatar(
                              radius: 80,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 78,
                                backgroundImage: AssetImage(AppImages.selfImage),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Hi, I am Raghavendra Reddy',
                        textStyle: TextStyle(
                          color: AppColors.purple,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Preah',
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    totalRepeatCount: 5,
                  ),
                  const SizedBox(height: 20),
                  // Enhanced role container
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [
                        AppColors.purple,
                        Colors.blue.shade400,
                      ],
                    ).createShader(bounds),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.purple.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: const Text(
                        'Student & Tech Enthusiast',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Preah',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Enhanced tagline with animation
                  AnimatedTextKit(
                    animatedTexts: [
                      FadeAnimatedText(
                        'I love to code and bring \nideas to life through code.',
                        textStyle: const TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    ],
                    repeatForever: true,
                  ),
                  const SizedBox(height: 40),
                  // Enhanced social buttons
                  _buildSocialButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildAnimatedSocialButton(
          'https://www.linkedin.com/in/raghavendra-reddy-padala-28bbb6256/',
          SocialIconsFlutter.linkedin_box,
        ),
        const SizedBox(width: 20),
        _buildAnimatedSocialButton(
          'https://github.com/Raghavendra-Reddy-Padala',
          SocialIconsFlutter.github,
        ),
        const SizedBox(width: 20),
        _buildAnimatedSocialButton(
          'https://www.instagram.com/mr_reddy369_/',
          SocialIconsFlutter.instagram,
        ),
      ],
    );
  }

  Widget _buildAnimatedSocialButton(String link, IconData iconData) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 800),
      builder: (context, double value, child) {
        return Transform.scale(
          scale: value,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => html.window.open(link, '_blank'),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.purple.withOpacity(0.2),
                      Colors.blue.withOpacity(0.2),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.purple.withOpacity(0.5),
                  ),
                ),
                child: Icon(
                  iconData,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

