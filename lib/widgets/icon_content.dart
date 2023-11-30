import 'package:bmi_calculator/consenants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconContent({
    required this.icon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        Text(
          text,
          style: labelTextStyle,
        )
      ],
    );
  }
}
