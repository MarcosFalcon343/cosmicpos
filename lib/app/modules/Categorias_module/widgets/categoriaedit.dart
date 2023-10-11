import 'package:cosmicpos/app/data/models/Productos/categoria.dart';
import 'package:cosmicpos/app/modules/Categorias_module/controller_categoria.dart';
import 'package:flutter/material.dart';

class CategoriaEdit extends StatefulWidget {
  final Categoria categoria;
  final CategoriaController controller;

  const CategoriaEdit(
      {Key? key, required this.categoria, required this.controller})
      : super(key: key);

  @override
  CategoriaEditState createState() {
    return CategoriaEditState();
  }
}

class CategoriaEditState extends State<CategoriaEdit> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nombreController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nombreController.text = widget.categoria.nombre;
  }

  @override
  void dispose() {
    nombreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Editar Categoria',
              style: TextStyle(fontSize: 18),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: ' Nombre'),
              controller: nombreController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa un nombre válido.';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Wrap(
              children: [
                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        nombreController.text.isNotEmpty) {
                      widget.controller.actualizarCategoria(
                        widget.categoria.id,
                        nombreController.text,
                      );
                      Navigator.of(context).pop(1);
                    }
                  },
                  child: const Text('Guardar'),
                ),
                const SizedBox(
                  width: 5,
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancelar'),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {
                      widget.controller.eliminarCategoria(widget.categoria.id);
                      Navigator.of(context).pop(1);
                    },
                    icon: const Icon(Icons.delete))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
