import 'package:flutter/material.dart';
import 'package:todo_app_bloc/presentation/models/task.dart';
import 'package:todo_app_bloc/presentation/screens/home_page/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key, required this.taskList}) : super(key: key);

  final List<Task> taskList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskList
              .map((task) => ExpansionPanelRadio(
                  body: ListTile(
                    title: SelectableText.rich(
                      TextSpan(children: [
                        const TextSpan(text: 'Text:\n'),
                        TextSpan(text: task.title),
                        const TextSpan(text: '\n\nDescription:\n'),
                        TextSpan(text: task.description),
                      ]),
                    ),
                  ),
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return TaskTile(taskListItems: task);
                  },
                  value: task.id))
              .toList(),
        ),
      ),
    );
  }
}


// Expanded(
//       child: ListView.builder(
//           itemCount: taskList.length,
//           itemBuilder: (contex, index) {
//             var taskListItems = taskList[index];
//             return TaskTile(taskListItems: taskListItems);
//           }),
//     )