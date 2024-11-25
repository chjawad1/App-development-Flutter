import 'package:flutter/material.dart';

class RepeatContainerCode extends StatelessWidget {
  final Color colors; // Background color of the container
  final Widget? cardWidget; // The widget displayed inside the container
  final void Function()? onPressed; // Callback for tap actions

  const RepeatContainerCode({
    required this.colors,
    this.cardWidget,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardWidget, // Use the passed widget inside the container
      ),
    );
  }
}

// CardWidget class remains unchanged
class CardWidget extends StatelessWidget {
  const CardWidget({
    required this.iconData,
    required this.label,
    required this.isActive,
  });

  final IconData iconData;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80.0,
          color: isActive ? Colors.blueAccent : Colors.white,
        ),
        SizedBox(height: 15.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            color: isActive ? Colors.blueAccent : Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}
