import 'package:cosmicpos/app/utils/utils.dart';
import 'package:cosmicpos/app/views/widgets/menus/drawer.dart';
import 'package:flutter/material.dart';

class ProveedoresScreen extends StatelessWidget {
  const ProveedoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const drawer(),
      appBar: Utils().appbar(context, 'Proveedores'),
      body: const Text('hi'),
    );
  }
}
