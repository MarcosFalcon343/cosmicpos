import 'package:cosmicpos/app/data/models/Actores/cliente.dart';
import 'package:flutter/material.dart';

class ClienteView extends StatelessWidget {
  final Cliente cliente;
  final VoidCallback onPress;
  const ClienteView({super.key, required this.cliente, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: FilledButton(
          onPressed: onPress,
          child: Row(
            children: [
              Text(cliente.nombres),
              const SizedBox(
                width: 10,
              ),
              Text(cliente.apellidoPaterno)
            ],
          )),
    );
  }
}
