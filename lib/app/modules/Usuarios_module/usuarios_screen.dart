import 'package:cosmicpos/app/core/theme/utils/utils.dart';
import 'package:cosmicpos/app/widgets/menus/drawer.dart';
import 'package:flutter/material.dart';

class UsuariosScreen extends StatelessWidget {
  const UsuariosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const drawer(),
      appBar: Utils().appbar(context, 'Usuarios'),
      body: const Text('Hi'),
    );
  }
}