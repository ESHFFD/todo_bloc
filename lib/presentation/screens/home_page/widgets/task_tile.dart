import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_bloc/presentation/bloc/bloc_exports.dart';
import 'package:todo_app_bloc/presentation/models/task.dart';
import 'package:todo_app_bloc/presentation/screens/home_page/widgets/popup.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.taskListItems,
  });

  final Task taskListItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(Icons.star_border_outlined),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        taskListItems.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            decoration: taskListItems.isDone == true
                                ? TextDecoration.lineThrough
                                : null,
                            fontSize: 18),
                      ),
                      Text(
                        DateFormat()
                            .add_yMMMd()
                            .add_Hms()
                            .format(DateTime.now()),
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Checkbox(
            onChanged: taskListItems.isDeleted == false
                ? (value) {
                    context
                        .read<TasksBloc>()
                        .add(UpdateTask(tasks: taskListItems));
                  }
                : null,
            value: taskListItems.isDone,
          ),
          PopUpItem(
            onTap: () => _removeOrDeleteTask(context, taskListItems),
          )
        ],
      ),
    );
  }
}

void _removeOrDeleteTask(BuildContext ctx, Task task) {
  task.isDeleted!
      ? ctx.read<TasksBloc>().add(DeleteTask(tasks: task))
      : ctx.read<TasksBloc>().add(RemoveTask(tasks: task));
}
// ListTile(
//       title: Text(
//         taskListItems.title,
//         overflow: TextOverflow.ellipsis,
//         style: TextStyle(
//             decoration: taskListItems.isDone == true
//                 ? TextDecoration.lineThrough
//                 : null),
//       ),
//       trailing: Checkbox(
//         onChanged: taskListItems.isDeleted == false
//             ? (value) {
//                 context.read<TasksBloc>().add(UpdateTask(tasks: taskListItems));
//               }
//             : null,
//         value: taskListItems.isDone,
//       ),
//       onLongPress: () {
//         _removeOrDeleteTask(context, taskListItems);
//       },
//     )