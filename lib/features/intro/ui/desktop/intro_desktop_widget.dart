import 'package:flutter/material.dart';
import 'package:raghavareddy/design/constants/app_animations.dart';
import 'package:raghavareddy/design/constants/app_images.dart';
import 'package:raghavareddy/design/utils/app_colors.dart';
import 'package:rive/rive.dart';
import 'package:social_media_flutter/social_media_flutter.dart';
import 'dart:html' as html;

class IntroDesktopWidget extends StatelessWidget {
  const IntroDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: w / 20),
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.bottomRight,
            child: RiveAnimation.asset(AppAnimations.introAnimation),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Preah',
                          fontSize: w / 20,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          const TextSpan(text: 'Hi, I\'m '),
                          TextSpan(
                            text: 'Raghavendra Reddy',
                            style: TextStyle(color: AppColors.purple),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'A Student & Tech Enthusiast',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: w / 40,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Crafting code to bring ideas to life...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: w / 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        socialIcon('https://github.com/Raghavendra-Reddy-Padala', SocialIconsFlutter.github),
                        SizedBox(width: 20),
                        socialIcon('https://www.linkedin.com/in/raghavendra-reddy-padala-28bbb6256/', SocialIconsFlutter.linkedin_box),
                        SizedBox(width: 20),
                        socialIcon('https://www.instagram.com/mr_reddy369_/?__pwa=1', SocialIconsFlutter.instagram),
                      ],
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: w / 8,
                backgroundColor: AppColors.purple.withOpacity(0.2),
                child: CircleAvatar(
                  radius: w / 8 - 8,
                  backgroundImage: const AssetImage(AppImages.selfImage),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget socialIcon(String link, IconData iconPath) {
    return InkWell(
      onTap: () => html.window.open(link, '_blank'),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.purple.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SocialWidget(
          placeholderText: '',
          iconData: iconPath,
          iconColor: AppColors.purple,
          iconSize: 24,
          link: link,
        ),
      ),
    );
  }
}
