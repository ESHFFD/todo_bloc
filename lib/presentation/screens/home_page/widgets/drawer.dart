import 'package:flutter/material.dart';
import 'package:todo_app_bloc/presentation/resources/router_management.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
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
        }, 'My Tasks', '0', Icons.folder_special),
        const Divider(),
        _drawerListTile(() {
          Navigator.of(context).pushReplacementNamed(Routes.recycleBin);
        }, 'Bin', '0', Icons.delete)
      ]),
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
