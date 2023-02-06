import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/presentation/bloc/bloc/tasks_bloc.dart';
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
              title: Text(
                taskListItems.title,
                style: TextStyle(
                    decoration: taskListItems.isDone == true
                        ? TextDecoration.lineThrough
                        : null),
              ),
              trailing: Checkbox(
                onChanged: (value) {
                  contex
                      .read<TasksBloc>()
                      .add(UpdateTask(tasks: taskListItems));
                },
                value: taskListItems.isDone,
              ),
              onLongPress: () {
                contex.read<TasksBloc>().add(DeleteTask(tasks: taskListItems));
              },
            );
          }),
    );
  }
}
