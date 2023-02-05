import 'package:flutter/material.dart';
import 'package:todo_app_bloc/presentation/models/task.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({Key? key}) : super(key: key);
  final List<Task> taskList = [
    Task(title: 'This is a 1 Task'),
    Task(title: 'This is a 1 Task'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("todo app"),
      ),
      body: Column(children: [
        const Center(
          child: Chip(label: Text('Tasks:')),
        ),
        ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (contex, index) {
              var taskListItems = taskList[index];
              return ListTile(
                title: Text(taskListItems.title),
                trailing: Checkbox(
                  onChanged: (value) {},
                  value: null,
                ),
              );
            })
      ]),
    );
  }
}
