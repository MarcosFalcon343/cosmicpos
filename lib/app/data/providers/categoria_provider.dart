import 'package:cosmicpos/app/data/models/Productos/categoria.dart';
import 'package:cosmicpos/app/data/models/Productos/categoria_model.dart';

class CategoriaProvider {
  static CategoriaModel model = CategoriaModel();

  static void addCategoria(String name) async {
    await model.categoriaExists(name)
        ? print('Ya existe esa categoria')
        : await model.addCategoria(name);
  }

  static void delateCategoria(String id) async {
    Categoria? categoria = await model.getCategoria(id);
    categoria != null
        ? categoria.active = false
        : print('No existe la categoria');
  }

  static void updateCategoria(String id, String nombre) async {
    Categoria? categoria = await model.getCategoria(id);
    categoria != null
        ? await model.updateCategoria(id, Categoria(id: id, nombre: nombre))
        : print('No existe la categoria');
  }

  static Future<Categoria?> getCategoria(String id) async {
    return await model.getCategoria(id);
  }

  static Future<List<Categoria>> getAllCategoriasActivas() async {
    List<Categoria> categorias = await model.getAllCategorias();
    List<Categoria> activas = [];

    for (Categoria c in categorias) {
      if (c.active) activas.add(c);
    }
    return activas;
  }

  static Future<List<Categoria>> getAllCategorias() async {
    return await model.getAllCategorias();
  }
}
