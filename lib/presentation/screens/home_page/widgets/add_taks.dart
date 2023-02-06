import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/presentation/bloc/bloc/tasks_bloc.dart';
import 'package:todo_app_bloc/presentation/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Add Task',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
              label: Text('Tilte'),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    var task = Task(
                        title: titleController.text,
                        id: DateTime.now().toString());
                    context.read<TasksBloc>().add(AddTask(tasks: task));
                    Navigator.pop(context);
                    titleController.clear();
                  },
                  child: const Text('Add')),
            ],
          )
        ],
      ),
    );
  }
}
