import 'package:flutter/material.dart';

class ProveedorForm extends StatefulWidget {
  const ProveedorForm({super.key});

  @override
  State<ProveedorForm> createState() => _ProveedorFormState();
}

class _ProveedorFormState extends State<ProveedorForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void close() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => close(),
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: const Text(
          'Agregar proveedor',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text('Nombre(s): *'),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text('Apellido Paterno: *'),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                    decoration: const InputDecoration(
                        label: Text('Apellido Materno:'),
                        border: OutlineInputBorder())),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                    decoration: const InputDecoration(
                        label: Text('Telefono: *'),
                        border: OutlineInputBorder())),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                    decoration: const InputDecoration(
                        label: Text('Nombre comercial: *'),
                        border: OutlineInputBorder())),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                    decoration: const InputDecoration(
                        label: Text('Giro comercial'),
                        border: OutlineInputBorder())),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    FilledButton(
                        onPressed: () {}, child: const Text('Guardar')),
                    const SizedBox(
                      width: 30,
                    ),
                    FilledButton(
                        onPressed: () => close(), child: const Text('Cancelar'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
