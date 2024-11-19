import 'package:flutter/material.dart';
class climate extends StatefulWidget {
  const climate({super.key});

  @override
  State<climate> createState() => _climateState();
}

class _climateState extends State<climate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ClimateApp'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: ()=>print('Clicked'),
          )
        ],
      ),
    );
  }
}
