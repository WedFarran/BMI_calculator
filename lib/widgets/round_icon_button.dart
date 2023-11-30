import 'package:flutter/material.dart';

import '../consenants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function()? onPress;
  const RoundIconButton({
    required this.icon,
    required this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 0,
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: const CircleBorder(),
      fillColor: sircularButtonColor,
      child: Icon(icon),
    );
  }
}
