import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:raghavareddy/design/utils/app_colors.dart';
import 'package:raghavareddy/design/widgets/buttons/app_outlined_button.dart';

class ResponsivePortfolioWidget extends StatelessWidget {
  const ResponsivePortfolioWidget({super.key});

 @override
Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      LayoutBuilder(
        builder: (context, constraints) {
          final ScreenType screenType = _getScreenType(constraints.maxWidth);

          Widget content = SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildSection(
                  context,
                  title: "My Projects",
                  child: _buildProjectsLayout(screenType),
                ),
                const SizedBox(height: 40),
                _buildSection(
                  context,
                  title: "Competitive Coding",
                  child: _buildCompetitiveCodingLinks(screenType),
                ),
              ],
            ),
          );

          if (screenType == ScreenType.desktop) {
            // Center align the widget for desktop mode
            content = Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200), // Limit max width
                child: content,
              ),
            );
          }
          if (screenType == ScreenType.largeTablet) {
            // Center align the widget for desktop mode
            content = Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900), // Limit max width
                child: content,
              ),
            );
          }
          if (screenType == ScreenType.tablet) {
            // Center align the widget for desktop mode
            content = Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600), // Limit max width
                child: content,
              ),
            );
          }

          return content;
        },
      ),
    ],
  );
}


  ScreenType _getScreenType(double width) {
    if (width > 1200) return ScreenType.desktop;
    if (width > 900) return ScreenType.largeTablet;
    if (width > 600) return ScreenType.tablet;
    return ScreenType.mobile;
  }

  Widget _buildSection(
      BuildContext context, {
        required String title,
        required Widget child,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  Widget _buildProjectsLayout(ScreenType screenType) {
    final projects = [
      {
        'image': 'assets/images/chatapp.jpg',
        'title': 'T-7 chat app',
        'description': 'The EETA Club app is a platform for students, where they can engage with various club activities, events, and member interactions. It is designed with Flutter and Firebase, offering a smooth experience for university communities. The app promotes collaboration, keeping users updated on upcoming events and news..',
        'github': 'https://github.com/Raghavendra-Reddy-Padala/chatapp',
        'appLink': 'http://team07-chatapp.web.app',
      },
      {
        'image': 'assets/images/eeta.jpg',
        'title': 'EETA',
        'description': 'The Team07 Chat app is a simple, efficient, and user-friendly chat application, offering real-time messaging, notifications, and easy access to group chats. Built using Flutter and Firebase, it ensures seamless communication and connection among users',
        'github': 'https://github.com/Raghavendra-Reddy-Padala/chatapp',
        'appLink': 'https://eeta-club.web.app/',
      },
      {
        'image': 'assets/images/chatapp.jpg',
        'title': 'T-7 chat app',
        'description': 'The EETA Club app is a platform for students, where they can engage with various club activities, events, and member interactions. It is designed with Flutter and Firebase, offering a smooth experience for university communities. The app promotes collaboration, keeping users updated on upcoming events and news..',
        'github': 'https://github.com/Raghavendra-Reddy-Padala/chatapp',
        'appLink': 'http://team07-chatapp.web.app',
      },
      {
        'image': 'assets/images/eeta.jpg',
        'title': 'EETA',
        'description': 'The Team07 Chat app is a simple, efficient, and user-friendly chat application, offering real-time messaging, notifications, and easy access to group chats. Built using Flutter and Firebase, it ensures seamless communication and connection among users',
        'github': 'https://github.com/Raghavendra-Reddy-Padala/chatapp',
        'appLink': 'https://eeta-club.web.app/',
      },
      {
        'image': 'assets/images/chatapp.jpg',
        'title': 'T-7 chat app',
        'description': 'The EETA Club app is a platform for students, where they can engage with various club activities, events, and member interactions. It is designed with Flutter and Firebase, offering a smooth experience for university communities. The app promotes collaboration, keeping users updated on upcoming events and news..',
        'github': 'https://github.com/Raghavendra-Reddy-Padala/chatapp',
        'appLink': 'http://team07-chatapp.web.app',
      },
    ];
    if (screenType == ScreenType.mobile) {
    return SizedBox(
      height: 350, // Fixed height for horizontal cards
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: projects.length,
        padding: EdgeInsets.symmetric(horizontal: 10), // Small padding on edges
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5), // Equal spacing between cards
            width: 300, // Fixed width for each card
            child: _buildProjectCard(projects[index], screenType),
          );
        },
      ),
    );
  }

    return Wrap(
      spacing: _getSpacing(screenType),
      runSpacing: 20,
      children: projects
          .map((project) => SizedBox(
        width: _getCardWidth(screenType),
        child: _buildProjectCard(project, screenType),
      ))
          .toList(),
    );
  }

  Widget _buildProjectCard(Map<String, String> project, ScreenType screenType) {
  return Card(
    margin: EdgeInsets.zero, // Remove default margins
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    color: AppColors.violet.withOpacity(0.9),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Increase Image Height
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          child: Image.asset(
            project['image']!,
            height: 180, // Larger height for the image
            fit: BoxFit.cover,
          ),
        ),
        // Padding for content
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project['title']!,
                style: TextStyle(
                  fontSize: _getTitleFontSize(screenType),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              // Allow Full Description Visibility
              Text(
                project['description']!,
                maxLines: 4,
                style: TextStyle(
                  fontSize: _getDescriptionFontSize(screenType),
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppOutlinedButton(
                      title: "GitHub",
                      onTap: () => _launchURL(project['github']!),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: AppOutlinedButton(
                      title: "App Link",
                      onTap: () => _launchURL(project['appLink']!),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


  Widget _buildCompetitiveCodingLinks(ScreenType screenType) {
    final platforms = [
      {'name': 'LeetCode', 'link': 'https://leetcode.com/u/raghavareddy121212/'},
      {'name': 'HackerRank', 'link': 'https://www.hackerrank.com/profile/raghavareddy1211'},
      {'name': 'IntervewBit', 'link': 'https://www.interviewbit.com/profile/raghava-reddy_980/'},
      {'name': 'GeeksForGeeks', 'link': 'https://www.geeksforgeeks.org/user/raghavared0yfg/'},
      

    ];

    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: platforms.map((platform) {
        return AppOutlinedButton(
          title: platform['name']!,
          onTap: () => _launchURL(platform['link']!),
          width: _getButtonWidth(screenType),
        );
      }).toList(),
    );
  }

  double _getSpacing(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.desktop:
      case ScreenType.largeTablet:
        return 30;
      case ScreenType.tablet:
        return 20;
      case ScreenType.mobile:
        return 10;
    }
  }

  double _getCardWidth(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.desktop:
        return 350;
      case ScreenType.largeTablet:
        return 300;
      case ScreenType.tablet:
        return 250;
      case ScreenType.mobile:
        return double.infinity;
    }
  }

  double _getImageHeight(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.desktop:
        return 180;
      case ScreenType.largeTablet:
        return 160;
      case ScreenType.tablet:
        return 140;
      case ScreenType.mobile:
        return 120;
    }
  }

  double _getTitleFontSize(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.desktop:
        return 18;
      case ScreenType.largeTablet:
        return 16;
      case ScreenType.tablet:
        return 14;
      case ScreenType.mobile:
        return 12;
    }
  }

  double _getDescriptionFontSize(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.desktop:
        return 14;
      case ScreenType.largeTablet:
        return 12;
      case ScreenType.tablet:
        return 11;
      case ScreenType.mobile:
        return 10;
    }
  }

  double _getButtonWidth(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.desktop:
        return 250;
      case ScreenType.largeTablet:
        return 200;
      case ScreenType.tablet:
        return 150;
      case ScreenType.mobile:
        return double.infinity;
    }
  }

  void _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $urlString';
    }
  }
}

enum ScreenType {
  desktop,
  largeTablet,
  tablet,
  mobile,
}
