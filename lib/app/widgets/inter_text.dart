import 'package:flutter/material.dart';

import '../utils/theme/app_colors.dart';

class InterText extends StatelessWidget {
  InterText({
    super.key,
    required this.title,
    this.textColor = AppColors.color001B0D,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 16,
    this.textAlign = TextAlign.start,
    this.maxLines = 10,
  });

  String title;
  Color textColor;
  FontWeight fontWeight;
  double fontSize;
  TextAlign textAlign;
  int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Inter',
        color: textColor,
        fontWeight: fontWeight,
        overflow: TextOverflow.ellipsis,
        fontSize: fontSize,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

TextStyle interTextStyle = const TextStyle(
  fontFamily: 'Inter',
  color: Colors.black,
  fontWeight: FontWeight.w500,
  fontSize: 14,
);
