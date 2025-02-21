import 'package:flutter/material.dart';
import 'package:raghavareddy/design/utils/app_colors.dart';
import 'package:raghavareddy/design/widgets/buttons/app_outlined_button.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBarDesktopWidget extends StatelessWidget {
  final ScrollController scrollController;
  final List<GlobalKey> sectionKeys;

  const NavBarDesktopWidget({
    super.key,
    required this.scrollController,
    required this.sectionKeys,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.maxFinite,
      color: AppColors.navBarColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(fontFamily: 'Preah', color: Colors.white, fontSize: 24),
                children: [
                  const TextSpan(text: 'Raghavendra '),
                  TextSpan(
                    text: 'Reddy',
                    style: TextStyle(fontFamily: 'Preah', color: AppColors.purple),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                _navItem('Home', () => _scrollToSection(0)),
                _navItem('Skills', () => _scrollToSection(1)),
                _navItem('Projects', () => _scrollToSection(2)),
                _navItem('Experience', () => _scrollToSection(3)),
                _navItem('Certifications', () => _scrollToSection(4)),
                _navItem('Contact', () => _scrollToSection(5)),
                const SizedBox(width: 20),
                AppOutlinedButton(
                  title: 'Resume',
                  onTap: () {
                    launchUrl(Uri.parse("https://res.cloudinary.com/dbmiv3gks/image/upload/v1740159722/resume_9_gwdmcn.pdf"));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  void _scrollToSection(int index) {
    final context = sectionKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}

