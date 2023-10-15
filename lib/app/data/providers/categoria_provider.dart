import 'package:cosmicpos/app/data/models/Productos/categoria.dart';
import 'package:cosmicpos/app/data/models/Productos/categoria_model.dart';

class CategoriaProvider {
  static CategoriaModel model = CategoriaModel();

  static void addCategoria(String name) async {
    await model.categoriaExists(name)
        ? print('Ya existe esa categoria')
        : await model.addCategoria(name);
  }

  static void deleteCategoria(int key) async {
    await model.deleteCategoria(key);
  }

  static void updateCategoria(int key, Categoria categoria) async {
    Categoria? categoria = await model.getCategoria(key);
    categoria != null
        ? await model.updateCategoria(key, categoria)
        : print('No existe la categoria');
  }

  static Future<Categoria?> getCategoria(int key) async {
    return await model.getCategoria(key);
  }

  static Future<List<Categoria>> getAllCategorias() async {
    return await model.getAllCategorias();
  }
}
