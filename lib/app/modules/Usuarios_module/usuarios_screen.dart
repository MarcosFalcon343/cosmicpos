import 'package:cosmicpos/app/core/theme/utils/helpers/image_helpers.dart';
import 'package:cosmicpos/app/core/theme/utils/utils.dart';
import 'package:cosmicpos/app/data/models/Usuarios/usuario.dart';
import 'package:cosmicpos/app/modules/Usuarios_module/widgets/usuario_view.dart';
import 'package:cosmicpos/app/widgets/menus/drawer.dart';
import 'package:flutter/material.dart';

class UsuariosScreen extends StatefulWidget {
  const UsuariosScreen({super.key});

  @override
  State<UsuariosScreen> createState() => _UsuariosScreenState();
}

class _UsuariosScreenState extends State<UsuariosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const drawer(),
      appBar: Utils().appbar(context, 'Usuarios'),
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
              child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              UsuarioView(
                usuario: Usuario(),
              ),
              UsuarioView(
                usuario: Usuario(),
              ),
            ],
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
