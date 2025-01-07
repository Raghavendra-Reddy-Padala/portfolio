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
                    title: "Projects",
                    subtitle: "more Projects yet to be added",
                    icon: Icons.work_rounded,
                    child: _buildProjectsLayout(screenType),
                  ),
                  const SizedBox(height: 40),
                  _buildSection(
                    context,
                    title: "Competitive Coding",
                    subtitle: "Check out my problem-solving journey",
                    icon: Icons.code_rounded,
                    child: _buildCompetitiveCodingLinks(screenType),
                  ),
                ],
              ),
            );

            // Responsive constraints
            if (screenType == ScreenType.desktop) {
              content = Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: content,
                ),
              );
            } else if (screenType == ScreenType.largeTablet) {
              content = Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: content,
                ),
              );
            } else if (screenType == ScreenType.tablet) {
              content = Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
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

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
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
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          child,
        ],
      ),
    );
  }
  Widget _buildProjectsLayout(ScreenType screenType) {
  final projects = [
    {
      'image': 'assets/images/eeta.jpg',
      'title': 'EETA',
      'description': 'The EETA Club app is a platform for students, where they can engage with various club activities, events, and member interactions. It is designed with Flutter and Firebase, offering a smooth experience for university communities. The app promotes collaboration, keeping users updated on upcoming events and news.',
      'github': 'https://github.com/Raghavendra-Reddy-Padala',
      'appLink': 'https://eeta-club.web.app/',
    },
    {
      'image': 'assets/images/Agroobizz.png',
      'title': 'Agrobizz',
      'description': 'AgroBizz is a platform that connects farmers and buyers, enabling them to buy and sell agricultural products. It offers a user-friendly interface and secure transactions, fostering a thriving agricultural community.',
      'github': 'https://github.com/Raghavendra-Reddy-Padala/Agrobizz',
      'appLink': 'https://agrobizz-6dd59.web.app/',
    },
    {
      'image': 'assets/images/AtomicFlow.png',
      'title': 'AtomicFlow',
      'description': 'AtomicFlow is a special app which helps users to create habits track them everyday show up their progress , features like pomodore notes and studyrooms which help to build productivity among users',
      'github': 'https://github.com/Raghavendra-Reddy-Padala/AtomicFlow',
      'appLink': 'https://github.com/Raghavendra-Reddy-Padala/AtomicFlow/blob/main/habit_tracker/README.md',
    },
    {
      'image': 'assets/images/chatapp.jpg',
      'title': 'T-7 app',
      'description': 'The Team07 Chat app is a simple, efficient, and user-friendly chat application, offering real-time messaging, notifications, and easy access to group chats. Built using Flutter and Firebase, it ensures seamless communication and connection among users',
      'github': 'https://github.com/Raghavendra-Reddy-Padala/chatapp',
      'appLink': 'http://team07-chatapp.web.app',
    },
    {
      'image': 'assets/images/weathernow.png',
      'title': 'WeathherNow',
      'description': 'WeatherNow is a weather app that provides real-time weather information, including temperature, humidity, and weather conditions. It offers a user-friendly interface and accurate weather data for users.',
      'github': 'https://github.com/Raghavendra-Reddy-Padala/WeatherNow',
      'appLink': 'https://github.com/Raghavendra-Reddy-Padala/WeatherNow/blob/main/README.md',
    },
    {
      'image': 'assets/images/fitflow.png',
      'title': 'FitFlow',
      'description': 'Fitflow is my personalized app it is helpful for my gym journey to track my workouts my PRs and to track my progress',
      'github': 'https://github.com/Raghavendra-Reddy-Padala/fitflow-pro',
      'appLink': 'https://gym-app-6969.web.app/',
    },
    {
      'image': 'assets/images/chintufy.png',
      'title': 'Chintufy',
      'description': 'Chintufy is a basic musicplayer app which helps users to play music from their local storage',
      'github': 'https://github.com/Raghavendra-Reddy-Padala/chintufy',
      'appLink': 'https://chintufy.web.app/',
    },
    {
      'image': 'assets/images/taskmaster.png',
      'title': 'TaskMaster',
      'description': 'TaskMaster is a task management app that helps users to manage their tasks By making todolists and setting reminders',
      'github': 'https://github.com/Raghavendra-Reddy-Padala/TASKMASTER',
      'appLink': 'https://github.com/Raghavendra-Reddy-Padala/TASKMASTER/blob/main/README.md',
    },
  ];

 if (screenType == ScreenType.mobile) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: projects.map((project) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: 300,
            // Remove fixed height constraint
            child: _buildProjectCard(project, screenType),
          );
        }).toList(),
      ),
    );
  }

  return Wrap(
    spacing: _getSpacing(screenType),
    runSpacing: 20,
    children: projects.map((project) {
      return SizedBox(
        width: _getCardWidth(screenType),
        child: _buildProjectCard(project, screenType),
      );
    }).toList(),
  );
}

  Widget _buildProjectCard(Map<String, String> project, ScreenType screenType) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: AppColors.violet.withOpacity(0.2),
          blurRadius: 15,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: AppColors.violet.withOpacity(0.2),
          width: 1,
        ),
      ),
      color: AppColors.violet.withOpacity(0.9),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Add this line
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio( // Use AspectRatio for consistent image sizing
            aspectRatio: 16 / 9,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(
                    project['image']!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppColors.violet.withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
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
                Text(
                  project['description']!,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: _getDescriptionFontSize(screenType),
                    color: Colors.white.withOpacity(0.8),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: _buildProjectButton(
                        "GitHub",
                        Icons.code,
                        () => _launchURL(project['github']!),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildProjectButton(
                        "Live Demo",
                        Icons.launch,
                        () => _launchURL(project['appLink']!),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
  Widget _buildProjectButton(String title, IconData icon, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.purple.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: AppColors.purple,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: AppColors.purple,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompetitiveCodingLinks(ScreenType screenType) {
    final platforms = [
      {
        'name': 'LeetCode',
        'link': 'https://leetcode.com/u/raghavareddy121212/',
        'icon': Icons.code,
      },
      {
        'name': 'HackerRank',
        'link': 'https://www.hackerrank.com/profile/raghavareddy1211',
        'icon': Icons.terminal,
      },
      {
        'name': 'IntervewBit',
        'link': 'https://www.interviewbit.com/profile/raghava-reddy_980/',
        'icon': Icons.person,
      },
      {
        'name': 'GeeksForGeeks',
        'link': 'https://www.geeksforgeeks.org/user/raghavared0yfg/',
        'icon': Icons.school,
      },
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.violet.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.violet.withOpacity(0.2),
        ),
      ),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        children: platforms.map((platform) {
          return _buildPlatformButton(
            platform['name'] as String,
            platform['link'] as String,
            platform['icon'] as IconData,
            screenType,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPlatformButton(
    String name,
    String link,
    IconData icon,
    ScreenType screenType,
  ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _launchURL(link),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: _getButtonWidth(screenType),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.purple.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: AppColors.purple,
                size: 20,
              ),
              const SizedBox(width: 12),
              Text(
                name,
                style: TextStyle(
                  color: AppColors.purple,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


  ScreenType _getScreenType(double width) {
    if (width > 1200) return ScreenType.desktop;
    if (width > 900) return ScreenType.largeTablet;
    if (width > 600) return ScreenType.tablet;
    return ScreenType.mobile;
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


enum ScreenType {
  desktop,
  largeTablet,
  tablet,
  mobile,
}
