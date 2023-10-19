import 'package:cosmicpos/app/data/models/Productos/producto.dart';
import 'package:flutter/material.dart';

class ProductoView extends StatelessWidget {
  Producto producto;
  ProductoView({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        padding: const EdgeInsets.all(5),
        child: FilledButton(
          child: Row(
            children: [
              Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: const Center(
                    child: Icon(
                      Icons.shopping_bag,
                      color: Colors.black,
                    ),
                  )),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      producto.sku,
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    ),
                    Text(
                      producto.nombre,
                      style: const TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '\$ ${producto.precio}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )
                  ],
                ),
              ))
            ],
          ),
          onPressed: () {},
        ));
  }
}
