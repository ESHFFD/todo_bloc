import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/presentation/bloc/bloc/tasks_bloc.dart';
import 'package:todo_app_bloc/presentation/models/task.dart';
import 'package:todo_app_bloc/presentation/screens/home_page/widgets/add_taks.dart';

import 'widgets/tasks_list.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.allTask;
        return Scaffold(
          appBar: AppBar(
            title: const Text("todo app"),
          ),
          body: Column(children: [
            const Center(
              child: Chip(label: Text('Tasks:')),
            ),
            TaskList(
              taskList: taskList,
            )
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _addTask(context);
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
