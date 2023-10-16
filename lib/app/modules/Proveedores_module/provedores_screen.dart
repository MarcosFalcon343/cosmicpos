import 'package:cosmicpos/app/core/theme/utils/helpers/image_helpers.dart';
import 'package:cosmicpos/app/core/theme/utils/utils.dart';
import 'package:cosmicpos/app/data/models/Actores/provedor.dart';
import 'package:cosmicpos/app/modules/Proveedores_module/Widget/provedor_view.dart';
import 'package:cosmicpos/app/modules/Proveedores_module/Widget/proveedor_form.dart';
import 'package:cosmicpos/app/modules/Proveedores_module/Widget/proveedor_formEdit.dart';
import 'package:cosmicpos/app/modules/Proveedores_module/proveedor_controller.dart';
import 'package:cosmicpos/app/widgets/menus/drawer.dart';
import 'package:flutter/material.dart';

class ProveedoresScreen extends StatefulWidget {
  final ProveedorController controller;
  const ProveedoresScreen({super.key, required this.controller});

  @override
  State<ProveedoresScreen> createState() => _ProveedoresScreenState();
}

class _ProveedoresScreenState extends State<ProveedoresScreen> {
  late List<Proveedor> _provedores = [];

  @override
  void initState() {
    super.initState();
    _cargar();
  }

  Future<void> _cargar() async {
    _provedores = await widget.controller.cargarProvedores();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const drawer(),
      appBar: Utils().appbar(context, 'Provedores'),
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
                itemCount: _provedores.length,
                itemBuilder: (context, index) {
                  return ProveedorView(
                      onPress: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProveedorEditForm(
                                        provedor: _provedores[index])))
                            .then((value) {
                          if (value != null) {
                            _cargar();
                          }
                        });
                      },
                      proveedor: _provedores[index]);
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ProveedorForm())).then((value) {
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
