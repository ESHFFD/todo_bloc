// Hello ehsan this is arman and its my yadughary for you baaabes
import 'package:flutter/material.dart';
import 'package:todo_app_bloc/presentation/bloc/bloc_exports.dart';
import 'package:todo_app_bloc/presentation/models/task.dart';
import 'package:todo_app_bloc/presentation/screens/home_page/widgets/tasks_list.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.favoriteTask;
        return Column(children: [
          Center(
            child: Chip(label: Text('${taskList.length} Tasks')),
          ),
          TaskList(
            taskList: taskList,
          )
        ]);
      },
    );
  }
}
