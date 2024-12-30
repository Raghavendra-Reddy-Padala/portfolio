import 'package:flutter/material.dart';
import 'package:raghavareddy/features/certifications/certidesk.dart';
import 'package:raghavareddy/features/certifications/certimobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CertificationWidget extends StatelessWidget {
  const CertificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (context) => const CertificationDesktopWidget(),
      tablet: (context) => const CertificationMobileWidget(),
      mobile: (context) => const CertificationMobileWidget(),
    );
  }
}
