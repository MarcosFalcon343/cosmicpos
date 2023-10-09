import 'package:cosmicpos/app/data/providers/producto_provider.dart';
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

  final TextEditingController nombreController = TextEditingController();

  @override
  void dispose() {
    nombreController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 200,
        ),
        child: Card(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Agregar Categoria', style: TextStyle(
                  fontSize: 18
                ),),
                TextFormField(
                  decoration: const InputDecoration(hintText: ' Nombre'),
                  controller: nombreController,
                ),
                const SizedBox(height: 10,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FilledButton(
                        child: const Text('Guardar'),
                        onPressed: () async{
                          CategoriaProvider.addCategoria(nombreController.text);
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(width: 10,),
                      FilledButton(onPressed: (){
                        Navigator.of(context).pop();
                        }, 
                        child: const Text('Cancelar'))
                    ],
                  )
              ],
            )),
    ),
      ),
    );
  }
}
