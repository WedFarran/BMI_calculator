import 'package:flutter/material.dart';

class ReusableCards extends StatelessWidget {
  final Color color;
  final Widget child;
  const ReusableCards({
    required this.color,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }
}
