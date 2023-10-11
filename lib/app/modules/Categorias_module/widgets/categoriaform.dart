import 'package:cosmicpos/app/data/models/Productos/categoria_model.dart';
import 'package:cosmicpos/app/modules/Categorias_module/controller_categoria.dart';
import 'package:flutter/material.dart';

class CategoriaForm extends StatefulWidget {
  const CategoriaForm({super.key});

  @override
  CategoriaFormState createState() {
    return CategoriaFormState();
  }
}

class CategoriaFormState extends State<CategoriaForm> {
  final _formKey = GlobalKey<FormState>();
  final CategoriaController controller = CategoriaController();

  final TextEditingController nombreController = TextEditingController();

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
                'Agregar Categoria',
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
                height: 10,
              ),
              Wrap(
                children: [
                  FilledButton(
                    child: const Text('Guardar'),
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          nombreController.text.isNotEmpty) {
                        controller.agregarCategoria(nombreController.text);
                        Navigator.of(context).pop(1);
                      }
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FilledButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        //CategoriaModel().categoriaResetBox();
                      },
                      child: const Text('Cancelar'))
                ],
              )
            ],
          )),
    );
  }
}
