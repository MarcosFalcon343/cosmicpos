import 'package:cosmicpos/app/core/theme/utils/helpers/image_helpers.dart';
import 'package:cosmicpos/app/core/theme/utils/utils.dart';
import 'package:cosmicpos/app/data/models/Actores/cliente.dart';
import 'package:cosmicpos/app/modules/Clientes_module/clientes_controller.dart';
import 'package:cosmicpos/app/modules/Clientes_module/widget/clientes_FomrEdit.dart';
import 'package:cosmicpos/app/modules/Clientes_module/widget/clientesForm.dart';
import 'package:cosmicpos/app/modules/Clientes_module/widget/clienteview.dart';
import 'package:cosmicpos/app/widgets/menus/drawer.dart';
import 'package:flutter/material.dart';

class ClientesScreen extends StatefulWidget {
  final ClientesController controller;
  const ClientesScreen({super.key, required this.controller});

  @override
  State<ClientesScreen> createState() => _ClientesScreenState();
}

class _ClientesScreenState extends State<ClientesScreen> {
  List<Cliente> _clientes = [];

  @override
  void initState() {
    _cargar();
    super.initState();
  }

  Future<void> _cargar() async {
    _clientes = await widget.controller.cargarClientes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const drawer(),
      appBar: Utils().appbar(context, 'Clientes'),
      body: Column(children: [
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
          itemCount: _clientes.length,
          itemBuilder: (context, index) {
            return ClienteView(
              onPress: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ClienteEditForm(cliente: _clientes[index])))
                    .then((value) {
                  if (value != null) {
                    _cargar();
                  }
                });
              },
              cliente: _clientes[index],
            );
          },
        ))
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ClienteForm()))
              .then((value) {
            if (value != null) {
              _cargar();
            }
          });
        },
        shape: const CircleBorder(),
        backgroundColor: (Theme.of(context).brightness == Brightness.dark)
            ? Theme.of(context).colorScheme.inversePrimary
            : Theme.of(context).colorScheme.primary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
