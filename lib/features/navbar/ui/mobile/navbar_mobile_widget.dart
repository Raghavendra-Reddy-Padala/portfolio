import 'package:flutter/material.dart';
import 'package:raghavareddy/design/utils/app_colors.dart';
import 'package:raghavareddy/design/widgets/buttons/app_outlined_button.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBarMobileWidget extends StatelessWidget {
  final ScrollController scrollController;
  final List<GlobalKey> sectionKeys;

  const NavBarMobileWidget({
    super.key,
    required this.scrollController,
    required this.sectionKeys,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.navBarColor,
      elevation: 0,
      title: RichText(
        text: TextSpan(
          style: const TextStyle(fontFamily: 'Preah', color: Colors.white, fontSize: 20),
          children: [
            TextSpan(
              text: 'HelloWorld',
              style: TextStyle(fontFamily: 'Preah', color: AppColors.purple),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: AppOutlinedButton(
            title: 'Resume',
            onTap: () {
              launchUrl(Uri.parse('https://res.cloudinary.com/dbmiv3gks/image/upload/v1736263114/resume.pdf'));
            },
          ),
        ),
      ],
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  final ScrollController scrollController;
  final List<GlobalKey> sectionKeys;

  const NavDrawer({
    super.key,
    required this.scrollController,
    required this.sectionKeys,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.navBarColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.purple,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            _navItem(context, 'Home', Icons.home, 0),
            _navItem(context, 'Skills', Icons.code, 1),
            _navItem(context, 'Projects', Icons.work, 2),
            _navItem(context, 'Experience', Icons.business_center, 3),
            _navItem(context, 'Certifications', Icons.card_membership, 4),
            _navItem(context, 'Contact', Icons.contact_mail, 5),
          ],
        ),
      ),
    );
  }

  Widget _navItem(BuildContext context, String title, IconData icon, int index) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        _scrollToSection(context, index);
      },
    );
  }

  void _scrollToSection(BuildContext context, int index) {
    final sectionContext = sectionKeys[index].currentContext;
    if (sectionContext != null) {
      Scrollable.ensureVisible(
        sectionContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}

