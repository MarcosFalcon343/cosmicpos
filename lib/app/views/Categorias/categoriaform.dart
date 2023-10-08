import 'package:flutter/material.dart';

class CategoriaForm extends StatefulWidget {
  const CategoriaForm({super.key, String? nombre, String? numeroProductos});

  @override
  CategoriaFormState createState() {
    return CategoriaFormState();
  }
}

class CategoriaFormState extends State<CategoriaForm> {
  final _formKey = GlobalKey<FormState>();

  final nombreController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nombreController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'El campo no puede estar vacio';
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: FilledButton(
                child: const Text('Guardar'),
                onPressed: () {},
              ),
            )
          ],
        ));
  }
}
