import 'package:cosmicpos/app/data/models/Actores/provedor.dart';
import 'package:cosmicpos/app/modules/Proveedores_module/proveedor_controller.dart';
import 'package:flutter/material.dart';

class ProveedorEditForm extends StatefulWidget {
  const ProveedorEditForm({Key? key, required this.provedor}) : super(key: key);

  final Proveedor provedor;

  @override
  State<ProveedorEditForm> createState() => _ProveedorEditFormState();
}

class _ProveedorEditFormState extends State<ProveedorEditForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nombresController = TextEditingController();
  TextEditingController paternoController = TextEditingController();
  TextEditingController maternoController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController nombreComercialController = TextEditingController();
  TextEditingController giroComercialController = TextEditingController();
  ProveedorController controller = ProveedorController();

  @override
  void initState() {
    nombresController.text = widget.provedor.nombres.toString();
    paternoController.text = widget.provedor.apellidoPaterno.toString();
    maternoController.text = widget.provedor.apellidoMaterno.toString();
    telefonoController.text = widget.provedor.telefono.toString();
    nombreComercialController.text = widget.provedor.nombreComercial.toString();
    giroComercialController.text = widget.provedor.giroComercial.toString();
    super.initState();
  }

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
                            widget.provedor.nombres = nombresController.text;
                            widget.provedor.apellidoPaterno =
                                paternoController.text;
                            widget.provedor.apellidoMaterno =
                                maternoController.text;
                            widget.provedor.telefono = telefonoController.text;
                            widget.provedor.nombreComercial =
                                nombreComercialController.text;
                            widget.provedor.giroComercial =
                                giroComercialController.text;
                            controller.actualizarProveedor(
                                widget.provedor.key as int, widget.provedor);
                            Navigator.of(context).pop(1);
                          }
                        },
                        child: const Text('Guardar')),
                    const SizedBox(
                      width: 30,
                    ),
                    FilledButton(
                        onPressed: () => close(),
                        child: const Text('Cancelar')),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () {
                          controller
                              .eliminarProveedor(widget.provedor.key as int);
                          Navigator.of(context).pop(1);
                        },
                        icon: const Icon(Icons.delete))
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
