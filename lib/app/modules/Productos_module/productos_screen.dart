import 'package:cosmicpos/app/core/theme/utils/utils.dart';
import 'package:cosmicpos/app/modules/Productos_module/widget/producto_form.dart';
import 'package:cosmicpos/app/widgets/menus/drawer.dart';
import 'package:flutter/material.dart';

class ProductosScreen extends StatelessWidget {
  const ProductosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const drawer(),
      appBar: Utils().appbar(context, 'Productos'),
      body: const ProductoForm(),
      // body: ProductoView(
      //   producto: Producto(
      //       sku: '7502345',
      //       nombre: 'Agua de horchata',
      //       precio: 23,
      //       costo: 23),
    );
  }
}
