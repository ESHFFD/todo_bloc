import 'package:flutter/material.dart';
import 'package:todo_app_bloc/presentation/bloc/bloc_exports.dart';
import 'package:todo_app_bloc/presentation/screens/home_page/widgets/drawer.dart';
import 'package:todo_app_bloc/presentation/screens/home_page/widgets/tasks_list.dart';

class RecycleScreen extends StatelessWidget {
  const RecycleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        var removedTask = state.removeTask;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Screen'),
          ),
          drawer: const MyDrawer(),
          body: Column(children: [
            Center(
              child: Chip(label: Text('${removedTask.length} Tasks')),
            ),
            TaskList(
              taskList: removedTask,
            )
          ]),
        );
      },
    );
  }
}
