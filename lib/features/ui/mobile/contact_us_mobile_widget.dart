import 'package:flutter/material.dart';
import 'package:raghavareddy/design/utils/app_colors.dart';
import 'package:social_media_flutter/widgets/icons.dart';
import 'package:social_media_flutter/widgets/text.dart';
import 'dart:html' as html;

class ContactUsMobileWidget extends StatelessWidget {
  const ContactUsMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 60),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Contact Me',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 8),
        const Text(
            "Wanna chat with me? Drop me a mail at 👇 or drop a dm at any of my socialmedia handles."),
        const SizedBox(height: 8),
        Text(
          'raghavareddy696969@gmail.com',
          style: TextStyle(color: AppColors.purple),
        ),
        const SizedBox(height: 20),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            
              socialIcon(
                  'https://github.com/akmadan', SocialIconsFlutter.github),
              socialIcon('www.linkedin.com/in/raghavendra-reddy-padala-28bbb6256',
                  SocialIconsFlutter.linkedin_box),
              
                    socialIcon('https://www.instagram.com/mr_reddy369_/?__pwa=1',
                  SocialIconsFlutter.instagram),
            ],
          ),
        ),
        const Divider(),
        const SizedBox(height: 20),
        const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Coded by P Raghavendra Reddy with 💚'),
            ],
          ),
        )
      ]),
    );
  }

  Widget socialIcon(String link, IconData iconPath) {
    return InkWell(
      onTap: () => html.window.open(link, '_blank'),
      child: SocialWidget(
        placeholderText: '',
        iconData: iconPath,
        iconSize: 20,
        iconColor: Colors.white,
        link: link,
      ),
    );
  }
}
