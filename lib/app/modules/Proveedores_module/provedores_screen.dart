import 'package:cosmicpos/app/core/theme/utils/helpers/image_helpers.dart';
import 'package:cosmicpos/app/core/theme/utils/utils.dart';
import 'package:cosmicpos/app/modules/Proveedores_module/Widget/proveedor_form.dart';
import 'package:cosmicpos/app/widgets/menus/drawer.dart';
import 'package:flutter/material.dart';

class ProveedoresScreen extends StatefulWidget {
  const ProveedoresScreen({super.key});

  @override
  State<ProveedoresScreen> createState() => _ProveedoresScreenState();
}

class _ProveedoresScreenState extends State<ProveedoresScreen> {
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProveedorForm()));
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
