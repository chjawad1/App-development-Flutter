import 'package:flutter/material.dart';

/// Reusable container widget for gender cards
class RepeatContainerCode extends StatelessWidget {
  const RepeatContainerCode({
    required this.colors,
    this.cardWidget,
    this.onPressed,
  });

  final Color colors;
  final Widget? cardWidget;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Centralized tap functionality
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: cardWidget,
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

