import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'add_task_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class TodayTaskScreen extends StatefulWidget {
  @override
  _TodayTaskScreenState createState() => _TodayTaskScreenState();
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  Future<void> toggleTheme(bool isDarkMode) async {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
  }

  Future<void> loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    bool? isDarkMode = prefs.getBool('isDarkMode');
    _themeMode = isDarkMode == true ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class _TodayTaskScreenState extends State<TodayTaskScreen> {
  List<Map<String, dynamic>> _tasks = [];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _loadTasks();
    _startOverdueCheck();
  }

  Future<void> _loadTasks() async {
    final db = await DatabaseHelper().database;
    List<Map<String, dynamic>> tasks = await db.query(
      'tasks',
      where: 'status = ?',
      whereArgs: ['pending'],
    );

    setState(() {
      _tasks = tasks.where((task) => task['id'] != 0).toList();
    });
  }

  // Start a timer to periodically check for overdue tasks
  void _startOverdueCheck() {
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      _checkForOverdueTasks();
    });
  }

  // Check if any tasks are overdue and update them to 'completed' if so
  Future<void> _checkForOverdueTasks() async {
    final now = DateTime.now();
    final db = await DatabaseHelper().database;

    for (var task in _tasks) {
      if (task['dueDate'] != null) {
        DateTime dueDate = DateTime.parse(task['dueDate']);
        if (dueDate.isBefore(now)) {
          await db.update(
            'tasks',
            {'status': 'completed'},
            where: 'id = ?',
            whereArgs: [task['id']],
          );
        }
      }
    }

    _loadTasks(); // Refresh task list after moving overdue tasks to "completed"
  }

  // Mark task as completed
  Future<void> _markTaskAsCompleted(int id) async {
    await DatabaseHelper().markAsCompleted(id);
    _loadTasks();
  }

  // Navigate to add task screen
  void _navigateToAddTaskScreen() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTaskScreen()),
    );
    _loadTasks();
  }

  // Edit task
  Future<void> _editTask(Map<String, dynamic> task) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTaskScreen(task: task)),
    );
    _loadTasks();
  }

  // Delete task
  Future<void> _deleteTask(int id) async {
    final db = await DatabaseHelper().database;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
    _loadTasks();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Today's Tasks"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _loadTasks, // Refreshes the task list
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                task['title'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              subtitle: Text(
                '${task['description']}\nDue: ${task['dueDate']} at ${task['dueTime'] ?? 'Time set'}',
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.green),
                    onPressed: () => _editTask(task),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteTask(task['id']),
                  ),
                  IconButton(
                    icon: Icon(Icons.check, color: Colors.blue),
                    onPressed: () => _markTaskAsCompleted(task['id']),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToAddTaskScreen,
        label: Text("Add Task"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
