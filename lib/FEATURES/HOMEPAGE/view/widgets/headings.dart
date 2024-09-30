
import 'package:flutter/material.dart';
import '../../../../common/styles/app_gaps.dart';
import '../../../../common/utils/app_text_names.dart';

class SectionHeading extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const SectionHeading({
    Key? key,
    required this.text,
    this.fontSize = 18.0,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppGaps.horizontalPadding16,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}


Widget get tipAndFeedHeading => const SectionHeading(
  text: AppTexts.appName,
);
