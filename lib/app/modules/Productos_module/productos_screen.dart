import 'package:cosmicpos/app/core/theme/utils/utils.dart';
import 'package:cosmicpos/app/widgets/menus/drawer.dart';
import 'package:flutter/material.dart';

class ProductosScreen extends StatelessWidget {
  const ProductosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: Utils().appbar(context, 'Productos'),
      body: const Text('Hello'),
    );
  }
}
