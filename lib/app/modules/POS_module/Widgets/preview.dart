import 'package:cosmicpos/app/core/theme/utils/helpers/image_helpers.dart';
import 'package:flutter/material.dart';

class Preview extends StatelessWidget {
  const Preview({Key? key, required this.subtotal, required this.total})
      : super(key: key);

  final double subtotal;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20, right: 15, left: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color(0xFFF0EFF4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Subtotal: \$ ${subtotal.toStringAsFixed(2)}'),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ImageHelpers().svgImage(
                  url: 'assets/sale.svg',
                  width: 20,
                  height: 20,
                  color: Colors.black,
                ),
              ),
              const Text('Descuento: '),
              TextButton(
                onPressed: () {},
                child: const Text('Agregar un descuento'),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {},
              child: Text('Total: \$ ${total.toStringAsFixed(2)}'),
            ),
          ),
        ],
      ),
    );
  }
}
