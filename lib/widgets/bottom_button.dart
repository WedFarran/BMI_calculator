import 'package:flutter/material.dart';

import '../consenants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.onTap, required this.title});

  final Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        color: bottomContainerColor,
        height: kBottomContainerHeight,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          title,
          style: calculateTextStyle,
        ),
      ),
    );
  }
}
