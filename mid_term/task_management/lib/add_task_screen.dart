import 'package:flutter/material.dart';
import 'database_helper.dart';

class AddTaskScreen extends StatefulWidget {
  final Map<String, dynamic>? task; // Add this parameter to accept a task for editing

  AddTaskScreen({this.task});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _dueDate;

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      // Populate fields if editing an existing task
      _titleController.text = widget.task!['title'] ?? '';
      _descriptionController.text = widget.task!['description'] ?? '';
      _dueDate = DateTime.tryParse(widget.task!['dueDate']);
    }
  }

  Future<void> _saveTask() async {
    final title = _titleController.text;
    final description = _descriptionController.text;
    final db = await DatabaseHelper().database;

    if (widget.task == null) {
      // Insert new task
      await db.insert('tasks', {
        'title': title,
        'description': description,
        'dueDate': _dueDate?.toIso8601String(),
        'status': 'pending'
      });
    } else {
      // Update existing task
      await db.update(
        'tasks',
        {
          'title': title,
          'description': description,
          'dueDate': _dueDate?.toIso8601String(),
          'status': 'pending'
        },
        where: 'id = ?',
        whereArgs: [widget.task!['id']],
      );
    }

    Navigator.pop(context); // Return to previous screen
  }

  void _pickDueDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _dueDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task == null ? 'Add Task' : 'Edit Task'), // Update title based on action
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Task Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Task Description'),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(_dueDate == null ? 'Select Due Date' : 'Due Date: ${_dueDate.toString()}'),
                Spacer(),
                ElevatedButton(
                  onPressed: _pickDueDate,
                  child: Text('Pick Date'),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: _saveTask,
              child: Text(widget.task == null ? 'Add Task' : 'Update Task'), // Button text changes based on action
            ),
          ],
        ),
      ),
    );
  }
}
