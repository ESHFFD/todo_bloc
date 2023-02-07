import 'package:flutter/material.dart';
import 'package:todo_app_bloc/presentation/screens/compeleted_view.dart';
import 'package:todo_app_bloc/presentation/screens/favorite_view.dart';

import 'package:todo_app_bloc/presentation/screens/home_page/widgets/add_taks.dart';
import 'package:todo_app_bloc/presentation/screens/home_page/widgets/drawer.dart';
import 'package:todo_app_bloc/presentation/screens/pending_view.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

final List<Map<String, dynamic>> _screens = [
  {'page_name': const PendingScreen(), 'title': 'Pending Task'},
  {'page_name': const CompeletedScreen(), 'title': 'Completed Task'},
  {'page_name': const FavoriteScreen(), 'title': 'Favorite Task'},
];

var selectedIndex = 0;

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[selectedIndex]['title']),
        actions: [
          IconButton(
              onPressed: () {
                _addTask(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: const MyDrawer(),
      body: _screens[selectedIndex]['page_name'],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                _addTask(context);
              },
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
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
