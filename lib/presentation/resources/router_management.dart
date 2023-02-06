import 'package:flutter/material.dart';
import 'package:todo_app_bloc/presentation/screens/home_page/home_page_screen.dart';
import 'package:todo_app_bloc/presentation/screens/recylce_page/recycle_screen.dart';

class Routes {
  static const String homePage = '/';
  static const String recycleBin = '/recycle-bin';
  static const String task = '/task-homepage';
}

class RoutManager {
  static Route getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case (Routes.recycleBin):
        return MaterialPageRoute(builder: (_) => const RecycleScreen());
      case (Routes.task):
        return MaterialPageRoute(builder: (_) => const HomePageScreen());
      default:
        return _unfounded();
    }
  }

  static Route _unfounded() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Not Found'),
              ),
              body: const Center(child: Text('Not Page Found')),
            ));
  }
}
