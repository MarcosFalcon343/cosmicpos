import 'package:cosmicpos/app/models/Productos/producto.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductosServices {
  late Box productosBox;

  ProductosServices() {
    productosBox = _abrirCaja() as Box;
  }

  Future<Box> _abrirCaja() async {
    Hive.initFlutter();
    return await Hive.openBox('Productos');
  }

  Future<void> addProduct(Producto producto) async {
    await productosBox.put(producto.id, producto);
  }

  Future<Producto?> getProduct(String id) async {
    return productosBox.get(id);
  }

  Future<List<Producto>> getProducts() async {
    return productosBox.values.toList() as List<Producto>;
  }

  Future<void> updateProduct(Producto producto) async {
    await productosBox.put(producto.id, producto);
  }

  Future<void> delateProducto(String id) async {
    await productosBox.delete(id);
  }

  Future<bool> existProduct(String id) async {
    return productosBox.containsKey(id);
  }
}
