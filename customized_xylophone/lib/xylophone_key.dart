import 'package:flutter/material.dart';
import 'sound_manager.dart';

class XylophoneKey extends StatelessWidget {
  final Color color;
  final int soundNumber;
  final SoundManager soundManager;
  final String soundPath;

  XylophoneKey({
    required this.color,
    required this.soundNumber,
    required this.soundManager,
    required this.soundPath,  // Added soundPath parameter
  });

  void handlePress() {
    soundManager.playSoundFromPath(soundPath);  // Corrected method name to playSoundFromPath
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: handlePress,
        child: Container(),
      ),
    );
  }
}
