import 'package:cosmicpos/app/data/models/Productos/producto.dart';
import 'package:hive/hive.dart';

class ProductoModel {
  ProductoModel();

  Future<void> addProducto(Producto producto) async {
    final productosBox = await Hive.openBox<Producto>('productos');
    await productosBox.add(producto);
  }

  Future<Producto?> getProducto(int key) async {
    final productosBox = await Hive.openBox<Producto>('productos');
    return productosBox.get(key);
  }

  Future<List<Producto>> getAllProductos() async {
    final productosBox = await Hive.openBox<Producto>('productos');
    final List<Producto> categorias = productosBox.values.toList();
    return categorias;
  }

  Future<void> updateProducto(int key, Producto categoria) async {
    final productosBox = await Hive.openBox<Producto>('productos');
    await productosBox.put(key, categoria);
  }

  Future<void> deleteProducto(int key) async {
    final productosBox = await Hive.openBox<Producto>('productos');
    await productosBox.delete(key);
  }

  Future<bool> productoExists(String name) async {
    final productosBox = await Hive.openBox<Producto>('productos');
    final categorias = productosBox.values;
    return categorias.any((categoria) => categoria.nombre == name);
  }

  Future<void> categoriaResetBox() async {
    final productosBox = await Hive.openBox<Producto>('productos');
    await productosBox.clear();
    productosBox.close();
  }
}
