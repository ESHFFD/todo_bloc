import 'package:flutter/material.dart';
import 'package:todo_app_bloc/presentation/models/task.dart';

class PopUpItem extends StatelessWidget {
  const PopUpItem({
    required this.task,
    required this.cancelOrDeleteItem,
    super.key,
  });
  final VoidCallback cancelOrDeleteItem;
  final Task task;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: const Icon(Icons.more_vert),
        itemBuilder: task.isDeleted == false
            ? (context) {
                return [
                  PopupMenuItem(
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                          label: const Text('Edit'))),
                  PopupMenuItem(
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark),
                          label: const Text('Bookmark'))),
                  PopupMenuItem(
                      child: TextButton.icon(
                          onPressed: cancelOrDeleteItem,
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete'))),
                ];
              }
            : (context) {
                return [
                  PopupMenuItem(
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.restore_from_trash),
                          label: const Text('Restor'))),
                  PopupMenuItem(
                      child: TextButton.icon(
                          onPressed: cancelOrDeleteItem,
                          icon: const Icon(Icons.remove),
                          label: const Text('Remove'))),
                ];
              });
  }
}
