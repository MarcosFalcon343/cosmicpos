import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
        onPressed: ()  async{
          Hive.initFlutter();
          var box = await Hive.openBox('mybox');
          var productos = box.get('productos');
          print('Productos: $productos');
        },
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
                // Container(
                //   height: 30,
                //   width: 50,
                //   decoration: BoxDecoration(
                //      borderRadius: BorderRadius.circular(20),
                //     color: Colors.white
                //   ),
                //   child:  Center(
                //     child: TextButton(onPressed: (){}, child: const Text('100',style: TextStyle(color: Colors.black),)),
                //   )
                // )
              ],
            ),
          ],
        ));
  }
}

// class _ProductoSubtotal extends StatelessWidget {
//   const _ProductoSubtotal({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         height: 35,
//         width: 100,
//         decoration: BoxDecoration(
//             color: Colors.white, borderRadius: BorderRadius.circular(20)),
//         child: const Center(
//           child: Text(
//             '\$ 1,000,000.00',
//             style: TextStyle(color: Colors.black),
//           ),
//         ),
//       ),
//     );
//   }
// }

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
