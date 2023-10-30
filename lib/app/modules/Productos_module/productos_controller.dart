import 'package:cosmicpos/app/data/models/Productos/producto.dart';
import 'package:cosmicpos/app/data/models/Productos/producto_model.dart';

class ProductoController {
  ProductoController();
  ProductoModel model = ProductoModel();

  void agregarProducto(Producto producto) {
    model.addProducto(producto);
  }

  Future<List<Producto>> cargarProductos() async {
    return model.getAllProductos();
  }

  void actualizarProducto(int key, Producto producto) {
    model.updateProducto(key, producto);
  }
}
