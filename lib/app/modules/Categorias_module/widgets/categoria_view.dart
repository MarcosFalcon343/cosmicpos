import 'package:flutter/material.dart';

class CategoriaView extends StatelessWidget {
  const CategoriaView(
      {super.key,
      required this.nombreCategoria,
      this.color = const Color(0xFF66717E)});

  final String nombreCategoria;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        height: 60,
        child: FilledButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(color),
                alignment: Alignment.centerLeft),
            onLongPress: () {
              print('Hello');
            },
            onPressed: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  nombreCategoria,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )));
  }
}
