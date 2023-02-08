import 'package:flutter/material.dart';

class PopUpItem extends StatelessWidget {
  const PopUpItem({
    required this.onTap,
    super.key,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: const Icon(Icons.more_vert),
        itemBuilder: (context) {
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
                    onPressed: onTap,
                    icon: const Icon(Icons.delete),
                    label: const Text('Delete'))),
          ];
        });
  }
}
