import 'package:cosmicpos/models/Product.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductoService {
  ProductoService();

  void pruebas() async {
    final producto = Producto(
      id: '1',
      sku: '7501000131440',
      nombre: 'PAN BIMBO MULTIGRANO 540 GRS ORIGINAL - BIMBO - 1 PIEZA',
      precio: '59.2',
      costo: '45.0',
    );

    var box = await Hive.openBox('Productos');
    box.put(producto.id, producto);
    final productoLeido = box.get('1');
    print(productoLeido.toString());
  }
}
