import 'package:cosmicpos/app/core/theme/utils/helpers/image_helpers.dart';
import 'package:cosmicpos/app/core/theme/utils/utils.dart';
import 'package:cosmicpos/app/data/models/Productos/categoria.dart';
import 'package:cosmicpos/app/data/providers/producto_provider.dart';
import 'package:cosmicpos/app/modules/Categorias_module/widgets/categoria_view.dart';
import 'package:cosmicpos/app/modules/Categorias_module/widgets/categoriaform.dart';
import 'package:cosmicpos/app/widgets/menus/drawer.dart';
import 'package:flutter/material.dart';

class CategoriasScreen extends StatefulWidget {
  const CategoriasScreen({super.key});

  @override
  State<CategoriasScreen> createState() => _CategoriasScreenState();
}

class _CategoriasScreenState extends State<CategoriasScreen> {
  final List<Categoria> _categorias = [];

  @override
  void initState() {
    super.initState();
    _loadCategorias();
  }

  Future<void> _loadCategorias() async {
    final categorias = await CategoriaProvider.getAllCategoriasActivas();
    setState(() {
      _categorias.addAll(categorias);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const drawer(),
      appBar: Utils().appbar(context, 'Categoria'),
      body: Column(
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
            child: ListView.builder(
              itemCount: _categorias.length,
              itemBuilder: (context, index) {
                return CategoriaView(nombreCategoria: _categorias[index].nombre);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) {
            return const CategoriaForm();
          }).then((value) async {
            if (value != null) {
              await _loadCategorias();
            }
          });
          setState(() {
            
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
