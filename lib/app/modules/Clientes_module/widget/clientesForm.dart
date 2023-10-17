import 'package:cosmicpos/app/data/models/Actores/cliente.dart';
import 'package:cosmicpos/app/modules/Clientes_module/clientes_controller.dart';
import 'package:flutter/material.dart';

class ClienteForm extends StatefulWidget {
  const ClienteForm({super.key});

  @override
  State<ClienteForm> createState() => _ClienteFormState();
}

class _ClienteFormState extends State<ClienteForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nombresController = TextEditingController();
  TextEditingController paternoController = TextEditingController();
  TextEditingController maternoController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController correoController = TextEditingController();
  ClientesController controller = ClientesController();

  @override
  void dispose() {
    nombresController.dispose();
    paternoController.dispose();
    maternoController.dispose();
    telefonoController.dispose();
    correoController.dispose();
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
          'Agregar Cliente',
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
                  controller: nombresController,
                  decoration: const InputDecoration(
                      label: Text('Nombre(s): *'),
                      border: OutlineInputBorder()),
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
                TextFormField(
                  controller: paternoController,
                  decoration: const InputDecoration(
                      label: Text('Apellido Paterno: *'),
                      border: OutlineInputBorder()),
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
                TextFormField(
                  controller: maternoController,
                  decoration: const InputDecoration(
                      label: Text('Apellido Materno:'),
                      border: OutlineInputBorder()),
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
                TextFormField(
                  controller: telefonoController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      label: Text('Telefono:'), border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: correoController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      label: Text('Correo:'), border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    FilledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Cliente cliente = Cliente(
                                nombres: nombresController.text,
                                apellidoPaterno: paternoController.text,
                                apellidoMaterno: maternoController.text,
                                telefono: telefonoController.text,
                                correo: correoController.text);
                            controller.agregarCliente(cliente);
                            Navigator.of(context).pop(1);
                          }
                        },
                        child: const Text('Guardar')),
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
