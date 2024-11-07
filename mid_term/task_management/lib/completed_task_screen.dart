import 'package:flutter/material.dart';
import 'database_helper.dart';

class CompletedTaskScreen extends StatefulWidget {
  @override
  _CompletedTaskScreenState createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  List<Map<String, dynamic>> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadCompletedTasks();
  }

  Future<void> _loadCompletedTasks() async {
    final db = await DatabaseHelper().database;
    List<Map<String, dynamic>> tasks = await db.query(
      'tasks',
      where: 'status = ? AND id > ?',
      whereArgs: ['completed', 1], // Exclude predefined tasks
    );

    setState(() {
      _tasks = tasks;
    });
  }

  Future<void> _deleteTask(int taskId) async {
    final db = await DatabaseHelper().database;
    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [taskId],
    );
    _loadCompletedTasks(); // Refresh the list of tasks after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Completed Tasks')),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_tasks[index]['title']),
            subtitle: Text(_tasks[index]['description']),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () async {
                // Confirm deletion with a dialog
                bool? confirmDelete = await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Delete Task'),
                    content: Text('Are you sure you want to delete this task?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                );

                // If confirmed, delete the task
                if (confirmDelete == true) {
                  await _deleteTask(_tasks[index]['id']);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
