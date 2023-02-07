import 'package:flutter/material.dart';
import 'package:todo_app_bloc/presentation/bloc/bloc_exports.dart';
import 'package:todo_app_bloc/presentation/resources/router_management.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
          return Column(children: [
            Container(
              padding: const EdgeInsets.only(top: 60, left: 20, bottom: 20),
              color: Colors.grey,
              width: double.infinity,
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            _drawerListTile(() {
              Navigator.of(context).pushReplacementNamed(Routes.task);
            }, 'My Tasks', '${state.allTask.length}', Icons.folder_special),
            const Divider(),
            _drawerListTile(() {
              Navigator.of(context).pushReplacementNamed(Routes.recycleBin);
            }, 'Bin', '${state.removeTask.length}', Icons.delete),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Switch(
                    value: state.switchValue,
                    onChanged: (newVAlue) {
                      newVAlue
                          ? context.read<SwitchBloc>().add(SwitchOnEvent())
                          : context.read<SwitchBloc>().add(SwitchOffEvent());
                    });
              },
            )
          ]);
        },
      ),
    );
  }
}

Widget _drawerListTile(
    VoidCallback onTap, String title, trailing, IconData icon) {
  return GestureDetector(
    onTap: onTap,
    child: ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Text(trailing),
    ),
  );
}
