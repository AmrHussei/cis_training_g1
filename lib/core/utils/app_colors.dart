import 'package:flutter/material.dart';

class AppColors {
  // static HexColor background = HexColor('#1C1C23');

  static Color amr(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Colors.blue
        : Colors.yellow;
  }

  // Primary Colors
  static Color primary(BuildContext context) => const Color(0xFF023936);
  static Color notificationCard(BuildContext context) =>
      const Color(0x0D39360D);
  static Color primaryOP5(BuildContext context) => const Color(0x0D135C58);
  static Color secondColor(BuildContext context) => const Color(0xff023936);
  static Color warrningColor(BuildContext context) => const Color(0xffBD7611);
  static Color thirdColor(BuildContext context) => const Color(0xFFBC2A46);
  static Color mainColor(BuildContext context) => const Color(0xFF00DB81);

  // Typography
  static Color typographyHeading(BuildContext context) =>
      const Color(0xFF161D1C);
  static Color typographySubTitle(BuildContext context) =>
      const Color(0xFF6F6F6F);
  static Color typographyBody(BuildContext context) => const Color(0xFF444B5C);

  // Icons
  static Color iconsThAndTCaptions(BuildContext context) =>
      const Color(0xFF6B778C);
  static Color decremntButton(BuildContext context) => const Color(0xFFCCCCCC);
  static Color iconsPrimary(BuildContext context) => const Color(0xFF292927);
  static Color iconsTertiary(BuildContext context) => const Color(0xFF6B778C);

  // Inputs
  static Color inputLabel(BuildContext context) => const Color(0xFF24262D);
  static Color inputBorder(BuildContext context) => const Color(0xFFE9E9E9);
  static Color separatingBorder1(BuildContext context) =>
      const Color(0xFFD6D9E1);
  static Color inputsPlaceholder(BuildContext context) =>
      const Color(0xFFBBBBBB);
  static Color separatingBorder(BuildContext context) =>
      const Color(0xFFEBEEF3);
  static Color desert100(BuildContext context) => const Color(0xFFF4EBE1);

  // Background
  static Color backgroundPrimary(BuildContext context) =>
      const Color(0xFFFAFAFA);
  static Color backgroundTertiary(BuildContext context) =>
      const Color(0xFFEBEBE6);
  static Color backgroundGrey(BuildContext context) => const Color(0xFFF5F5F5);
  static Color appBarBackground(BuildContext context) =>
      const Color(0xFF023936);
  static Color lightGreen(BuildContext context) => const Color(0xFFE8F7F5);

  // Buttons
  static Color buttonsDisabled(BuildContext context) => const Color(0xFFEAEAEA);
  static Color buttonsPrimary(BuildContext context) => const Color(0xFF135C58);

  // Dialog
  static Color success(BuildContext context) => const Color(0xFF0E8340);
  static Color error(BuildContext context) => const Color(0xFFD32F2F);
  static Color danger(BuildContext context) => const Color(0xFFD32F2F);

  // Basic Colors
  static Color white(BuildContext context) => const Color(0xFFffffff);
  static Color shadow(BuildContext context) => const Color(0xFF00000A);
  static Color black(BuildContext context) => const Color(0xFF000000);
}
