import 'package:flutter/material.dart';
import 'database_helper.dart';

class RepeatedTaskScreen extends StatefulWidget {
  @override
  _RepeatedTaskScreenState createState() => _RepeatedTaskScreenState();
}

class _RepeatedTaskScreenState extends State<RepeatedTaskScreen> {
  List<Map<String, dynamic>> _repeatedTasks = [];

  @override
  void initState() {
    super.initState();
    _loadRepeatedTasks();
  }

  Future<void> _loadRepeatedTasks() async {
    final db = await DatabaseHelper().database;
    List<Map<String, dynamic>> tasks = await db.query(
      'tasks',
      where: 'repeatDaily = ? OR selectedDays != ?',
      whereArgs: [1, ''],
    );

    setState(() {
      _repeatedTasks = tasks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Repeated Tasks")),
      body: ListView.builder(
        itemCount: _repeatedTasks.length,
        itemBuilder: (context, index) {
          final task = _repeatedTasks[index];
          return ListTile(
            title: Text(task['title']),
            subtitle: Text(task['description']),
          );
        },
      ),
    );
  }
}
