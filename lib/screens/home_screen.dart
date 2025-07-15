import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widgets/task_item.dart';
import '../widgets/filter_chip_row.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  final String motivationalQuote =
      "✨ Believe in yourself. You can do it!";

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        actions: [
          if (taskProvider.todayTasksCount > 0)
            Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 8.0),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Icon(Icons.home),
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.red,
                  ),
                ],
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              motivationalQuote,
              style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
          ),
          FilterChipRow(),
          Expanded(
            child: ListView.builder(
              itemCount: taskProvider.tasks.length,
              itemBuilder: (ctx, i) => TaskItem(task: taskProvider.tasks[i]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => AddTaskScreen(),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}