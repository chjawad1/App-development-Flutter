import 'package:flutter/material.dart';
import 'xylophone_key.dart';
import 'sound_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customized Xylophone',
      home: XylophoneHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class XylophoneHomePage extends StatefulWidget {
  @override
  _XylophoneHomePageState createState() => _XylophoneHomePageState();
}

class _XylophoneHomePageState extends State<XylophoneHomePage> {
  final SoundManager soundManager = SoundManager();

  // Initial colors for the keys
  List<Color> keyColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple,
  ];

  // Initial sound files for the keys
  List<String> soundFiles = List.generate(7, (index) => 'assets/note${index + 1}.wav');

  // Method to play sound when key is tapped
  void playSound(String soundPath) async {
    await soundManager.playSoundFromPath(soundPath); // Updated method name
  }

  // Method to change the key color
  void changeKeyColor(int index) async {
    Color selectedColor = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pick a color for Key ${index + 1}'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: keyColors[index],
              onColorChanged: (color) {
                setState(() {
                  keyColors[index] = color;
                });
              },
            ),
          ),
          actions: [
            TextButton(
              child: Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Method to change sound file for the key
  void changeSound(int index) async {
    if (await Permission.storage.request().isGranted) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.audio,
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        setState(() {
          soundFiles[index] = result.files.single.path!;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No sound file selected.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customized Xylophone'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(7, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () => playSound(soundFiles[index]), // Tap to play sound
              onLongPress: () => changeKeyColor(index), // Long press to change color
              onDoubleTap: () => changeSound(index), // Double tap to change sound
              child: Container(
                color: keyColors[index], // Key color
                child: Center(
                  child: Text(
                    'Key ${index + 1}',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
