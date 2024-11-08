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

  // Function that gets triggered when the repeat icon is clicked
  Future<void> _onRepeatIconClick(Map<String, dynamic> task) async {
    // Toggle repeat status or update due date based on repeat interval
    bool isTaskRepeated = task['isRepeated'] == 1; // Assuming 1 means "repeat enabled"

    // Update task repeat status in the database
    await DatabaseHelper().updateTaskRepeatStatus(task['id'], !isTaskRepeated);

    // Show confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(isTaskRepeated ? "Task set to non-repeating." : "Task set to repeat.")),
    );

    // Refresh the list of tasks after change
    _loadRepeatedTasks();
    setState(() {}); // Rebuild UI to reflect changes
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
              bool isTaskRepeated = task['isRepeated'] == 1; // Assuming 1 means repeat is enabled

              return ListTile(
                title: Text(task['title']),
                subtitle: Text('Due: ${task['dueDate']}'),
                trailing: IconButton(
                  icon: Icon(isTaskRepeated ? Icons.repeat : Icons.repeat_one),
                  onPressed: () => _onRepeatIconClick(task), // Trigger action on click
                  color: isTaskRepeated ? Colors.blue : Colors.grey, // Color based on repeat status
                ),
              );
            },
          );
        },
      ),
    );
  }
}
