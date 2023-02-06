import 'package:flutter/material.dart';
import 'package:todo_app_bloc/presentation/screens/home_page/widgets/drawer.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Screen'),
      ),
      drawer: MyDrawer(),
    );
  }
}
