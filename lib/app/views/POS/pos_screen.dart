import 'package:cosmicpos/app/utils/utils.dart';
import 'package:cosmicpos/app/views/POS/options.dart';
import 'package:cosmicpos/app/views/POS/preview.dart';
import 'package:cosmicpos/app/views/POS/product_pos.dart';
import 'package:cosmicpos/app/views/widgets/menus/drawer.dart';
import 'package:flutter/material.dart';

class PosScreen extends StatelessWidget {
  const PosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final color = Theme.of(context).colorScheme;
    return Scaffold(
        drawer: const drawer(),
        appBar: Utils().appbar(context, 'Ventas'),
        body: _PosView(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: FloatingActionButton(
            onPressed: () {},
            shape: const CircleBorder(),
            backgroundColor: (brightness == Brightness.dark)
                ? color.inversePrimary
                : color.primary,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ));
  }
}

class _PosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Options(),
        Expanded(
            child: ListView(
          padding: const EdgeInsets.all(10),
          children: const [
            ProductPosPreview(
              sku: '000',
              nombre: 'Hello',
              precio: 4,
            ),
          ],
        )),
        const Preview(
          subtotal: 0,
          total: 0,
        )
      ],
    );
  }
}
