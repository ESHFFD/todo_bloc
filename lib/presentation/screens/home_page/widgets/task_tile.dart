import 'package:flutter/material.dart';
import 'package:todo_app_bloc/presentation/bloc/bloc_exports.dart';
import 'package:todo_app_bloc/presentation/models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.taskListItems,
  });

  final Task taskListItems;

  @override
  Widget build(BuildContext context) {
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
          context.read<TasksBloc>().add(UpdateTask(tasks: taskListItems));
        },
        value: taskListItems.isDone,
      ),
      onLongPress: () {
        _removeOrDeleteTask(context, taskListItems);
      },
    );
  }
}

void _removeOrDeleteTask(BuildContext ctx, Task task) {
  task.isDeleted!
      ? ctx.read<TasksBloc>().add(DeleteTask(tasks: task))
      : ctx.read<TasksBloc>().add(RemoveTask(tasks: task));
}
