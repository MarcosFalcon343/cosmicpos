import 'package:cosmicpos/app/core/theme/utils/helpers/image_helpers.dart';
import 'package:cosmicpos/app/core/theme/utils/utils.dart';
import 'package:cosmicpos/app/data/models/Productos/categoria.dart';
import 'package:cosmicpos/app/modules/Categorias_module/controller_categoria.dart';
import 'package:cosmicpos/app/modules/Categorias_module/widgets/categoria_view.dart';
import 'package:cosmicpos/app/modules/Categorias_module/widgets/categoriaedit.dart';
import 'package:cosmicpos/app/modules/Categorias_module/widgets/categoriaform.dart';
import 'package:cosmicpos/app/widgets/menus/drawer.dart';
import 'package:flutter/material.dart';

class CategoriasScreen extends StatefulWidget {
  final CategoriaController controller;
  const CategoriasScreen({super.key, required this.controller});

  @override
  State<CategoriasScreen> createState() => _CategoriasScreenState();
}

class _CategoriasScreenState extends State<CategoriasScreen> {
  late List<Categoria> _categorias = [];

  @override
  void initState() {
    super.initState();
    _cargar();
  }

  Future<void> _cargar() async {
    _categorias = await widget.controller.cargarCategorias();
    setState(() {});
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
                return CategoriaView(
                  categoria: _categorias[index],
                  onPress: () async {
                    await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: CategoriaEdit(
                              categoria: _categorias[index],
                              controller: CategoriaController(),
                            ),
                          );
                        }).then((value) {
                      if (value != null) {
                        _cargar();
                      }
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  content: CategoriaForm(),
                );
              }).then((value) async {
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
