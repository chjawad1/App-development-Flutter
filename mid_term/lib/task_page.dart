import 'package:flutter/material.dart';

class TodayTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Today's Tasks"), // Placeholder for the list of tasks due today
    );
  }
}

class CompletedTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Completed Tasks"), // Placeholder for the completed task list
    );
  }
}

class RepeatedTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Repeated Tasks"), // Placeholder for repeated task list
    );
  }
}
