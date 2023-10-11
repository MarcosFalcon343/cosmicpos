import 'package:cosmicpos/app/data/models/Productos/categoria.dart';
import 'package:cosmicpos/app/data/providers/categoria_provider.dart';

class CategoriaController {
  CategoriaController();

  Future<List<Categoria>> cargarCategorias() async {
    final categorias = await CategoriaProvider.getAllCategoriasActivas();
    return categorias;
  }

  void agregarCategoria(String name) {
    CategoriaProvider.addCategoria(name);
  }

  void actualizarCategoria(String id, String nuevo) {
    CategoriaProvider.updateCategoria(id, nuevo);
  }

  void eliminarCategoria(String id) {
    CategoriaProvider.delateCategoria(id);
  }
}
