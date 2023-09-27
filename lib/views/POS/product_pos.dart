import 'package:flutter/material.dart';

class ProductPosPreview extends StatelessWidget {
  final String sku;
  final String nombre;
  final double precio;
  final int cantidad;

  const ProductPosPreview(
      {super.key,
      required this.sku,
      required this.nombre,
      required this.precio,
      required this.cantidad});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      child: const Row(
        children: [_ImagenProducto(), _datosProducto(), _ProductoSubtotal()],
      ),
    );
  }
}

class _ProductoSubtotal extends StatelessWidget {
  const _ProductoSubtotal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 35,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: const Center(
          child: Text(
            '\$ 1,000,000.00',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class _datosProducto extends StatelessWidget {
  const _datosProducto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(5),
      child: const Row(
        children: [
          Expanded(
            child: Column(
              children: [Text('000000'), Text('Coca cola'), Text('\$ 10.00')],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text('X'),
          Text('5'),
        ],
      ),
    ));
  }
}

class _ImagenProducto extends StatelessWidget {
  const _ImagenProducto({
    super.key,
  });

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
