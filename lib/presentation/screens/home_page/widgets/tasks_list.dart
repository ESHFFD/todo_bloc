import 'package:flutter/material.dart';
import 'package:todo_app_bloc/presentation/models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key, required this.taskList}) : super(key: key);

  final List<Task> taskList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (contex, index) {
            var taskListItems = taskList[index];
            return ListTile(
              title: Text(taskListItems.title),
              trailing: Checkbox(
                onChanged: (value) {},
                value: taskListItems.isDone,
              ),
            );
          }),
    );
  }
}
