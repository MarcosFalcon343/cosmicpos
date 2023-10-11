import 'package:cosmicpos/app/data/models/Productos/categoria.dart';
import 'package:flutter/material.dart';

class CategoriaView extends StatelessWidget {
  const CategoriaView(
      {super.key,
      required this.categoria,
      this.color = const Color(0xFF66717E),
      this.onPress});

  final Categoria categoria;
  final Color? color;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        height: 60,
        child: FilledButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(color),
                alignment: Alignment.centerLeft),
            onPressed: onPress,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  categoria.nombre,
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
