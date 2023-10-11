import 'package:cosmicpos/app/data/models/Usuarios/usuario.dart';
import 'package:flutter/material.dart';

class UsuarioView extends StatelessWidget {
  const UsuarioView({super.key, required this.usuario});
  final Usuario usuario;

  @override
  Widget build(BuildContext context) {
    return FilledButton(onPressed: () {}, child: const Text('hello'));
  }
}
