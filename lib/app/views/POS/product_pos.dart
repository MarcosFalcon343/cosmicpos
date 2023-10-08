import 'package:flutter/material.dart';

class ProductPosPreview extends StatelessWidget {
  final String sku;
  final String nombre;
  final double precio;

  const ProductPosPreview({
    super.key,
    required this.sku,
    required this.nombre,
    required this.precio,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Color(0xFF66717E)),
        ),
        onLongPress: () {
          print('Hello');
        },
        onPressed: () async {},
        child: Column(
          children: [
            Row(
              children: [
                const _ImagenProducto(),
                const _datosProducto(),
                Center(
                    child: TextButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white)),
                        onPressed: () {},
                        child: const Text(
                          '100',
                          style: TextStyle(color: Colors.black),
                        ))),
              ],
            ),
          ],
        ));
  }
}

class _datosProducto extends StatelessWidget {
  const _datosProducto();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(5),
      child: const Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '754177830419',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
                Text(
                  'ATOLE KLASS VAINILLA 45GRS - KLASS - 1 PIEZA',
                  style: TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$ 4.90',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class _ImagenProducto extends StatelessWidget {
  const _ImagenProducto();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: const Center(
        child: Icon(
          Icons.shopping_bag,
          color: Colors.black,
        ),
      ),
    );
  }
}
