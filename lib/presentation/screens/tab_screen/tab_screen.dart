import 'package:flutter/material.dart';

import 'package:todo_app_bloc/presentation/screens/home_page/widgets/add_taks.dart';
import 'package:todo_app_bloc/presentation/screens/home_page/widgets/drawer.dart';
import 'package:todo_app_bloc/presentation/screens/pending_view.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab Screen'),
        actions: [
          IconButton(
              onPressed: () {
                _addTask(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: const MyDrawer(),
      body: const PendingScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTask(context);
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {},
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: 'Pending Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done), label: 'Compeleted Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite Tasks'),
        ],
      ),
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
