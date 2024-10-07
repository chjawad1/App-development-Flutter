import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: XylophoneHomePage(),
    );
  }
}

class XylophoneHomePage extends StatefulWidget {
  @override
  _XylophoneHomePageState createState() => _XylophoneHomePageState();
}

class _XylophoneHomePageState extends State<XylophoneHomePage> {
  final player = AudioCache();  // Preload sounds using AudioCache
  List<Color> keyColors = [
    Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.teal, Colors.blue, Colors.purple
  ];  // Initial colors for each key

  List<int> soundNumbers = [1, 2, 3, 4, 5, 6, 7]; // Initial sound numbers for each key

  void playSound(int soundNumber) {
    player.play('note$soundNumber.wav');  // Playing sound
  }

  // Function to build a key
  Expanded buildKey({required Color color, required int soundNumber}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          playSound(soundNumber);  // Play the sound on key press
          setState(() {
            // Change visual feedback on tap, optional glow or color effect
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          color: color,  // The selected color
          child: null,  // Empty container for xylophone key
        ),
      ),
    );
  }

  // Show color picker dialog to customize the key color
  void openColorPicker(int index) async {
    Color? selectedColor = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: keyColors[index],
              onColorChanged: (Color color) {
                setState(() {
                  keyColors[index] = color;
                });
              },
            ),
          ),
          actions: <Widget>[
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

  // Dropdown to change sound number
  void changeSound(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Sound Number'),
          content: DropdownButton<int>(
            value: soundNumbers[index],
            items: [1, 2, 3, 4, 5, 6, 7].map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text('Sound $value'),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                soundNumbers[index] = newValue!;
              });
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customized Xylophone'),
        actions: [
          IconButton(
            icon: Icon(Icons.color_lens),
            onPressed: () {
              // Allow user to customize all key colors at once, if needed
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(7, (index) {
          return Expanded(
            child: GestureDetector(
              onLongPress: () {
                // Allow user to change key color and sound on long press
                openColorPicker(index);
                changeSound(index);
              },
              child: buildKey(
                color: keyColors[index],
                soundNumber: soundNumbers[index],
              ),
            ),
          );
        }),
      ),
    );
  }
}
