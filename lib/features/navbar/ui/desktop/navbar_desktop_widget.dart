
import 'package:flutter/material.dart';
import 'package:raghavareddy/design/utils/app_colors.dart';
import 'package:raghavareddy/design/widgets/buttons/app_outlined_button.dart';


class NavBarDesktopWidget extends StatelessWidget {
  const NavBarDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: double.maxFinite,
        color: AppColors.navBarColor,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                  style:
                      const TextStyle(fontFamily: 'Preah', color: Colors.white),
                  children: [
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: ' ',
                      style: TextStyle(
                          fontFamily: 'Preah', color: AppColors.purple),
                    ),
                    const TextSpan(text: ''),
                  ]),
            ),
            AppOutlinedButton(
              title: 'Hello World',
              onTap: () {
                // try {
                //   html.window.open(
                //       'https://akshitmadan9134.graphy.com/courses/Learn-to-make-apps-in-Flutter-6443deb6e4b01162ff92ed9d',
                //       '_blank');
                // } catch (e) {
                //   print(e.toString());
                // }
              },
            )
          ],
        )

            ));
  }
}
