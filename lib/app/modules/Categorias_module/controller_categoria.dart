import 'package:cosmicpos/app/data/models/Productos/categoria.dart';
import 'package:cosmicpos/app/data/providers/categoria_provider.dart';

class CategoriaController {
  CategoriaController();

  Future<List<Categoria>> cargarCategorias() async {
    final categorias = await CategoriaProvider.getAllCategorias();
    return categorias;
  }

  void agregarCategoria(String name) {
    CategoriaProvider.addCategoria(name);
  }

  void actualizarCategoria(int key, Categoria nuevo) {
    CategoriaProvider.updateCategoria(key, nuevo);
  }

  void eliminarCategoria(int key) {
    CategoriaProvider.deleteCategoria(key);
  }
}
