import 'package:cosmicpos/app/data/models/Actores/provedor.dart';
import 'package:cosmicpos/app/modules/Proveedores_module/proveedor_controller.dart';
import 'package:flutter/material.dart';

class ProveedorForm extends StatefulWidget {
  const ProveedorForm({super.key});

  @override
  State<ProveedorForm> createState() => _ProveedorFormState();
}

class _ProveedorFormState extends State<ProveedorForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nombresController = TextEditingController();
  TextEditingController paternoController = TextEditingController();
  TextEditingController maternoController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController nombreComercialController = TextEditingController();
  TextEditingController giroComercialController = TextEditingController();
  ProveedorController controller = ProveedorController();
  @override
  void dispose() {
    nombresController.dispose();
    paternoController.dispose();
    maternoController.dispose();
    telefonoController.dispose();
    nombreComercialController.dispose();
    giroComercialController.dispose();
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
                        border: OutlineInputBorder())),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: telefonoController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      label: Text('Telefono: *'), border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa un numero válido.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: nombreComercialController,
                  decoration: const InputDecoration(
                      label: Text('Nombre comercial: *'),
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
                    controller: giroComercialController,
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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Proveedor proveedor = Proveedor(
                                nombres: nombresController.text,
                                apellidoPaterno: paternoController.text,
                                apellidoMaterno: maternoController.text,
                                telefono: telefonoController.text,
                                nombreComercial: nombreComercialController.text,
                                giroComercial: giroComercialController.text);
                            controller.agregarProveedor(proveedor);
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
