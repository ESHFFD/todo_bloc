import 'package:flutter/material.dart';
import 'package:todo_app_bloc/presentation/models/task.dart';
import 'package:todo_app_bloc/presentation/screens/home_page/widgets/task_tile.dart';

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
            return TaskTile(taskListItems: taskListItems);
          }),
    );
  }
}
