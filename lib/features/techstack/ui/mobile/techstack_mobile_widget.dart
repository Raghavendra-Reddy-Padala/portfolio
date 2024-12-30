import 'package:flutter/material.dart';
import 'package:raghavareddy/design/constants/app_constants.dart';
import 'package:raghavareddy/design/utils/app_colors.dart';
import 'package:raghavareddy/design/widgets/app_image_widget.dart';
import 'package:raghavareddy/design/widgets/buttons/app_outlined_button.dart';

class TechstackMobileWidget extends StatefulWidget {
  const TechstackMobileWidget({super.key});

  @override
  State<TechstackMobileWidget> createState() => _TechstackMobileWidgetState();
}

class _TechstackMobileWidgetState extends State<TechstackMobileWidget> {
  String? selectedSkill; // Tracks the name of the tapped skill

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
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  runSpacing: 12,
                  children: techStackImages.entries.map((entry) {
                    return techStackCircle(entry.key, entry.value);
                  }).toList(),
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
                  fontSize: 20,
                ),
              ),
            ],

            const SizedBox(height: 20),

            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Preah',
                  fontSize: 24,
                ),
                children: [
                  const TextSpan(
                      text:
                          'These are some of the technologies which I have worked on and had built a few\n'),
                  TextSpan(
                      text: 'interesting projects\n',
                      style: TextStyle(color: AppColors.purple)),
                  const TextSpan(text: 'with them.'),
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
      child: Container(
        margin: const EdgeInsets.all(6),
        height: 54,
        width: 54,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.violet,
        ),
        child: Tooltip(
          message: skillName, // Tooltip for hover (on web platforms)
          child: AppImageWidget(
            path: imagePath,
          ),
        ),
      ),
    );
  }
}
