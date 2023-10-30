import 'package:cosmicpos/app/core/theme/utils/utils.dart';
import 'package:cosmicpos/app/data/models/Productos/producto.dart';
import 'package:cosmicpos/app/modules/Productos_module/productos_controller.dart';
import 'package:cosmicpos/app/modules/Productos_module/widget/producto_edit.dart';
import 'package:cosmicpos/app/modules/Productos_module/widget/producto_form.dart';
import 'package:cosmicpos/app/modules/Productos_module/widget/producto_view.dart';
import 'package:cosmicpos/app/widgets/menus/drawer.dart';
import 'package:flutter/material.dart';

class ProductosScreen extends StatefulWidget {
  const ProductosScreen({super.key, required this.controller});

  final ProductoController controller;

  @override
  State<ProductosScreen> createState() => _ProductosScreenState();
}

class _ProductosScreenState extends State<ProductosScreen> {
  List<Producto> _productos = [];

  @override
  void initState() {
    super.initState();
    _cargar();
  }

  Future<void> _cargar() async {
    _productos = await widget.controller.cargarProductos();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const drawer(),
      appBar: Utils().appbar(context, 'Productos'),
      body: ListView.builder(
          itemCount: _productos.length,
          itemBuilder: (context, index) {
            return ProductoView(
              producto: _productos[index],
              onPress: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductoEdit(producto: _productos[index])))
                    .then((value) {
                  if (value != null) {
                    _cargar();
                  }
                });
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductoForm()))
              .then((value) {
            if (value != null) {
              _cargar();
            }
          });
        },
        shape: const CircleBorder(),
        backgroundColor: (Theme.of(context).brightness == Brightness.dark)
            ? Theme.of(context).colorScheme.inversePrimary
            : Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
