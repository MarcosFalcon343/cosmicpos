import 'package:cosmicpos/app/models/Productos/producto.dart';
import 'package:cosmicpos/app/services/productos_services.dart';

class ProductProvider {
  ProductosServices service = ProductosServices();

  void agregarProducto(Producto producto) async {
    // * Verificar si el no existe producto existe
    if (await service.existProduct(producto.id)) {
      await service.addProduct(producto);
    } else {
      print('el id de producto ya existe');
    }
    // *
  }
}
