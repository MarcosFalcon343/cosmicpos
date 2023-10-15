import 'package:cosmicpos/app/data/models/Actores/provedor.dart';
import 'package:flutter/material.dart';

class ProveedorView extends StatelessWidget {
  const ProveedorView(
      {super.key, required this.onPress, required this.proveedor});

  final VoidCallback onPress;
  final Proveedor proveedor;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        height: 60,
        child: FilledButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xFF66717E)),
                alignment: Alignment.centerLeft),
            onPressed: onPress,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${proveedor.nombres} ${proveedor.apellidoPaterno}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(proveedor.nombreComercial)
              ],
            )));
  }
}
