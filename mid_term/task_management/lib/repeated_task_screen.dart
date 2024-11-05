import 'package:flutter/material.dart';

class RepeatedTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Repeated Tasks")),
      body: ListView.builder(
        itemCount: 5,  // Replace with actual data count
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Task $index'),
            subtitle: Text('Due Today'),
          );
        },
      ),
    );
  }
}
