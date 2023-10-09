import 'package:flutter/material.dart';

class Utils {
  AppBar appbar(BuildContext context, String title) {
    final color = Theme.of(context).colorScheme;
    return AppBar(
      title: Text(title),
      actions: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: color.inversePrimary),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
          ),
        )
      ],
      centerTitle: true,
    );
  }
}
