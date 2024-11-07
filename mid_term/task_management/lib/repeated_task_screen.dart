import 'package:flutter/material.dart';
import 'database_helper.dart';

class RepeatedTaskScreen extends StatefulWidget {
  @override
  _RepeatedTaskScreenState createState() => _RepeatedTaskScreenState();
}

class _RepeatedTaskScreenState extends State<RepeatedTaskScreen> {
  late Future<List<Map<String, dynamic>>> _repeatedTasks;

  @override
  void initState() {
    super.initState();
    _loadRepeatedTasks();
  }

  void _loadRepeatedTasks() {
    _repeatedTasks = DatabaseHelper().getRepeatedTasks();
  }

  // Function that gets triggered when the icon is clicked
  void _onRepeatIconClick(Map<String, dynamic> task) {
    // You can define the action you want here
    // For example, navigate to the task details or mark the task as done
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Repeat icon clicked for task: ${task['title']}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Repeated Tasks')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _repeatedTasks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No repeated tasks found.'));
          }

          final tasks = snapshot.data!;

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return ListTile(
                title: Text(task['title']),
                subtitle: Text('Due: ${task['dueDate']}'),
                trailing: IconButton(
                  icon: Icon(Icons.repeat),
                  onPressed: () => _onRepeatIconClick(task), // Trigger action on click
                ),
              );
            },
          );
        },
      ),
    );
  }
}
