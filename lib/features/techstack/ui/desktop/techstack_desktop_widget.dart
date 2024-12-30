import 'package:flutter/material.dart';
import 'package:raghavareddy/design/constants/app_constants.dart';
import 'package:raghavareddy/design/utils/app_colors.dart';
import 'package:raghavareddy/design/widgets/app_image_widget.dart';
import 'package:raghavareddy/design/widgets/buttons/app_outlined_button.dart';

class TechstackDesktopWidget extends StatefulWidget {
  const TechstackDesktopWidget({super.key});

  @override
  State<TechstackDesktopWidget> createState() => _TechstackDesktopWidgetState();
}

class _TechstackDesktopWidgetState extends State<TechstackDesktopWidget> {
  String? selectedSkill; // Tracks the name of the hovered or tapped skill

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            AppOutlinedButton(title: "Skills", onTap: () {}),
            const SizedBox(height: 20),

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: techStackImages.entries
                      .take(7)
                      .map((entry) => techStackCircle(entry.key, entry.value))
                      .toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: techStackImages.entries
                      .skip(7)
                      .take(6)
                      .map((entry) => techStackCircle(entry.key, entry.value))
                      .toList(),
                ),
              ],
            ),

            if (selectedSkill != null) ...[
              const SizedBox(height: 20),
              Text(
                selectedSkill!,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Preah',
                  fontSize: 24,
                ),
              ),
            ],

            const SizedBox(height: 20),

            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'Preah', fontSize: 24),
                children: [
                  const TextSpan(
                      text:
                          'Here are some of the technologies which I have worked on and had build few interesting '),
                  TextSpan(
                      text: 'projects\n',
                      style: TextStyle(color: AppColors.purple)),
                  const TextSpan(
                      text: 'with them '),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget techStackCircle(String skillName, String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSkill = skillName; // Update skill name on tap
        });
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            selectedSkill = skillName; // Update skill name on hover
          });
        },
        onExit: (_) {
          setState(() {
            selectedSkill = null; // Clear skill name when hover exits
          });
        },
        child: Tooltip(
          message: skillName, // Show tooltip on hover
          child: Container(
            margin: const EdgeInsets.all(6),
            height: 54,
            width: 54,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.violet,
            ),
            child: AppImageWidget(
              path: imagePath,
            ),
          ),
        ),
      ),
    );
  }
}
