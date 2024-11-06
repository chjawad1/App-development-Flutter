import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'add_task_screen.dart';

class TodayTaskScreen extends StatefulWidget {
  @override
  _TodayTaskScreenState createState() => _TodayTaskScreenState();
}

class _TodayTaskScreenState extends State<TodayTaskScreen> {
  List<Map<String, dynamic>> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final db = await DatabaseHelper().database;
    List<Map<String, dynamic>> tasks = await db.query(
      'tasks',
      where: 'status = ?',
      whereArgs: ['pending'],
    );

    // Filter out predefined tasks if they exist by ID or other criteria
    tasks = tasks.where((task) => task['id'] != 0).toList();

    setState(() {
      _tasks = tasks;
    });
  }

  Future<void> _markTaskAsCompleted(int id) async {
    await DatabaseHelper().markAsCompleted(id);
    _loadTasks(); // Refresh task list
  }

  // Method to navigate to Add Task screen and refresh tasks on return
  void _navigateToAddTaskScreen() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTaskScreen()),
    );
    _loadTasks(); // Refresh task list after adding a task
  }

  Future<void> _editTask(Map<String, dynamic> task) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddTaskScreen(task: task), // Pass the existing task for editing
      ),
    );
    _loadTasks(); // Refresh task list after editing
  }

  Future<void> _deleteTask(int id) async {
    final db = await DatabaseHelper().database;
    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
    _loadTasks(); // Refresh task list after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Today's Tasks")),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return ListTile(
            title: Text(task['title']),
            subtitle: Text(task['description']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _editTask(task), // Edit task
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteTask(task['id']), // Delete task
                ),
                IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    _markTaskAsCompleted(task['id']);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddTaskScreen,
        child: Icon(Icons.add),
      ),
    );
  }
}
