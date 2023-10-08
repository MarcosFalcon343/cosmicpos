import 'package:cosmicpos/app/helpers/image_helpers.dart';
import 'package:cosmicpos/app/utils/utils.dart';
import 'package:cosmicpos/app/views/Categorias/categoria_view.dart';
import 'package:cosmicpos/app/views/Categorias/categoriaform.dart';
import 'package:cosmicpos/app/views/widgets/menus/drawer.dart';
import 'package:flutter/material.dart';

class CategoriasScreen extends StatelessWidget {
  const CategoriasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      drawer: const drawer(),
      appBar: Utils().appbar(context, 'Categoria'),
      body: _CategoriasView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: (brightness == Brightness.dark)
            ? color.inversePrimary
            : color.primary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _CategoriasView extends StatelessWidget {
  const _CategoriasView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(5),
            height: 50,
            child: SearchBar(
              leading: ImageHelpers().svgImage(
                  url: 'assets/search.svg',
                  width: 20,
                  height: 20,
                  color: Colors.black),
            )),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(5),
            children: const [
              CategoriaView(
                nombreCategoria: 'Abarrotes',
                numeroProductos: '4',
              ),
              CategoriaView(
                nombreCategoria: 'bebidas',
                numeroProductos: '6',
                color: Colors.purple,
              ),
              CategoriaForm(),
            ],
          ),
        )
      ],
    );
  }
}
