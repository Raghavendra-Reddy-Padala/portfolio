import 'package:flutter/material.dart';
import 'package:raghavareddy/features/navbar/ui/desktop/navbar_desktop_widget.dart';
import 'package:raghavareddy/features/navbar/ui/mobile/navbar_mobile_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavBarWidget extends StatelessWidget {
  final ScrollController scrollController;
  final List<GlobalKey> sectionKeys;
  final bool isMobile;

  const NavBarWidget({
    super.key,
    required this.scrollController,
    required this.sectionKeys,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (p0) => NavBarDesktopWidget(
        scrollController: scrollController,
        sectionKeys: sectionKeys,
      ),
      tablet: (p0) => NavBarMobileWidget(
        scrollController: scrollController,
        sectionKeys: sectionKeys,
      ),
      mobile: (p0) => NavBarMobileWidget(
        scrollController: scrollController,
        sectionKeys: sectionKeys,
      ),
    );
  }
}
