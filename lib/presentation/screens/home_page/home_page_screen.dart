import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/presentation/bloc/bloc/tasks_bloc.dart';
import 'package:todo_app_bloc/presentation/models/task.dart';

import 'widgets/tasks_list.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({Key? key}) : super(key: key);
  final TextEditingController titleController = TextEditingController();
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  //viewInsets is importent to handel keyboard when it popup
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text('Add Task'),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        label: Text('Tilte'),
                        border: OutlineInputBorder(),
                      ),
                    )
                  ],
                ),
              ),
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
