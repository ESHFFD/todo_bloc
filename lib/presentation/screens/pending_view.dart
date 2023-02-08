import 'package:flutter/material.dart';
import 'package:todo_app_bloc/presentation/bloc/bloc_exports.dart';
import 'package:todo_app_bloc/presentation/models/task.dart';
import 'package:todo_app_bloc/presentation/screens/home_page/widgets/tasks_list.dart';

class PendingScreen extends StatefulWidget {
  const PendingScreen({Key? key}) : super(key: key);

  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.pendingTask;
        return Column(children: [
          Center(
            child: Chip(
              label: Text(
                  '${taskList.length} Pending | ${state.compeletedTask.length} Compeleted'),
            ),
          ),
          TaskList(
            taskList: taskList,
          )
        ]);
      },
    );
  }
}
