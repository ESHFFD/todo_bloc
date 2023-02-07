import 'package:flutter/material.dart';
import 'package:todo_app_bloc/presentation/bloc/bloc_exports.dart';

import 'package:todo_app_bloc/presentation/models/task.dart';
import 'package:todo_app_bloc/presentation/screens/home_page/widgets/add_taks.dart';

import 'widgets/tasks_list.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.allTask;
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

void _addTask(BuildContext context) {
  showModalBottomSheet(
      // adding is scroll Cotroll
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                //viewInsets is importent to handel keyboard when it popup
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const AddTaskScreen(),
          ),
        );
      });
}
