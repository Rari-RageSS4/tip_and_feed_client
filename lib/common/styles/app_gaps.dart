import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// A utility class that provides predefined gap sizes and convenience methods
/// for creating consistent spacing across the app using the Gap widget.
class AppGaps {
  // Define common gap sizes
  static const double gap2 = 2.0;
  static const double gap4 = 4.0;
  static const double gap8 = 8.0;
  static const double gap12 = 12.0;
  static const double gap16 = 16.0;
  static const double gap24 = 24.0;
  static const double gap32 = 32.0;
  static const double gap48 = 48.0;
  static const double gap64 = 64.0;

  // Predefined Gap widgets for convenience
  static Gap get gapSmall => const Gap(gap8);
  static Gap get gapMedium => const Gap(gap16);
  static Gap get gapLarge => const Gap(gap32);
  static Gap get gapExtraLarge => const Gap(gap64);

  // Custom Gap widget for custom spacing
  static Gap customGap(double value) => Gap(value);

  // EdgeInsets values for consistent padding/margin
  static EdgeInsets get smallPadding => const EdgeInsets.all(gap8);
  static EdgeInsets get mediumPadding => const EdgeInsets.all(gap16);
  static EdgeInsets get largePadding => const EdgeInsets.all(gap32);

  static EdgeInsets get horizontalPadding16 => const EdgeInsets.symmetric(horizontal: gap16);
  static EdgeInsets get verticalPadding16 => const EdgeInsets.symmetric(vertical: gap16);

  static EdgeInsets get horizontalPadding24 => const EdgeInsets.symmetric(horizontal: gap24);
  static EdgeInsets get verticalPadding24 => const EdgeInsets.symmetric(vertical: gap24);

  static EdgeInsets get noPadding => EdgeInsets.zero;
}
