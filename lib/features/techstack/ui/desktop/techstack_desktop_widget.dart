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
  String? selectedSkill;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'My Tech Stack',
              style: TextStyle(
                color: AppColors.purple,
                fontFamily: 'Preah',
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: techStackImages.entries
                  .map((entry) => techStackCircle(entry.key, entry.value))
                  .toList(),
            ),
            if (selectedSkill != null) ...[
              const SizedBox(height: 30),
              Text(
                selectedSkill!,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Preah',
                  fontSize: 24,
                ),
              ),
            ],
            const SizedBox(height: 40),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.violet.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Preah',
                    fontSize: 20,
                  ),
                  children: [
                    const TextSpan(
                      text: 'These are the technologies I\'ve worked with to build ',
                    ),
                    TextSpan(
                      text: 'interesting projects',
                      style: TextStyle(color: AppColors.purple),
                    ),
                    const TextSpan(text: '. Always eager to learn more!'),
                  ],
                ),
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
          selectedSkill = skillName;
        });
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            selectedSkill = skillName;
          });
        },
        onExit: (_) {
          setState(() {
            selectedSkill = null;
          });
        },
        child: Tooltip(
          message: skillName,
          child: Container(
            height: 80,
            width: 80,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.violet.withOpacity(0.1),
              border: Border.all(color: AppColors.purple, width: 2),
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
