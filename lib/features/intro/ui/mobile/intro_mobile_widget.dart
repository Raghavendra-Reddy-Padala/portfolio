import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:raghavareddy/design/constants/app_images.dart';
import 'package:raghavareddy/design/utils/app_colors.dart';
import 'package:social_media_flutter/social_media_flutter.dart';
import 'dart:html' as html;

class IntroMobileWidget extends StatefulWidget {
  const IntroMobileWidget({super.key});

  @override
  State<IntroMobileWidget> createState() => _IntroMobileWidgetState();
}

class _IntroMobileWidgetState extends State<IntroMobileWidget> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 5));
    _confettiController.play(); // Start the confetti animation
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gradient Background
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.purple],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        // Confetti Animation
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            emissionFrequency: 0.05,
            numberOfParticles: 20,
            maxBlastForce: 10,
            minBlastForce: 5,
            gravity: 0.3,
          ),
        ),
        // Intro Content
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50), // Adjust spacing
              const CircleAvatar(
                radius: 64,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(AppImages.selfImage),
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Preah',
                    fontSize: 24,
                    height: 1.2,
                  ),
                  children: [
                    const TextSpan(text: 'Hi, I am '),
                    TextSpan(
                      text: 'Raghavendra Reddy',
                      style: TextStyle(color: AppColors.purple, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
                   RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.white,
                            height: 1.2,
                            fontFamily: 'Preah',
                            fontWeight: FontWeight.bold),
                        children: const [
                          TextSpan(text: 'I am student and '),
                          TextSpan(
                              text: ' a Tech Enthusiast\n',
                              style: TextStyle(
                                  backgroundColor: Colors.yellowAccent,
                                  color: Colors.black)),
                          TextSpan(
                              text: ' who loves code and vibe!')
                        ]),
                  ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialIcon(
                      'https://www.linkedin.com/in/raghavendra-reddy-padala-28bbb6256/',
                      SocialIconsFlutter.linkedin_box),
                  const SizedBox(width: 20),
                  socialIcon('https://github.com/raghavendrapadala',
                      SocialIconsFlutter.github),
                  const SizedBox(width: 20),
                  socialIcon(
                      'https://www.instagram.com/mr_reddy369_/?__pwa=1',
                      SocialIconsFlutter.instagram),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }

  Widget socialIcon(String link, IconData iconPath) {
    return InkWell(
      onTap: () => html.window.open(link, '_blank'),
      child: Icon(iconPath, color: Colors.white, size: 28),
    );
  }
}
