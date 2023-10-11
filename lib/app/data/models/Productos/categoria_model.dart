import 'package:cosmicpos/app/data/models/Productos/categoria.dart';
import 'package:hive/hive.dart';

class CategoriaModel {
  CategoriaModel();

  Future<void> addCategoria(String name) async {
    final categoriaBox = await Hive.openBox<Categoria>('categorias');
    Categoria categoria =
        Categoria(id: '${categoriaBox.length + 1}', nombre: name);
    categoria.key;
    await categoriaBox.put(categoria.id, categoria);
  }

  Future<Categoria?> getCategoria(String id) async {
    final categoriaBox = await Hive.openBox<Categoria>('categorias');
    return categoriaBox.get(id);
  }

  Future<List<Categoria>> getAllCategorias() async {
    final categoriaBox = await Hive.openBox<Categoria>('categorias');
    final List<Categoria> categorias = categoriaBox.values.toList();
    return categorias;
  }

  Future<void> updateCategoria(String id, Categoria newCategoria) async {
    final categoriaBox = await Hive.openBox<Categoria>('categorias');
    await categoriaBox.put(id, newCategoria);
  }

  Future<void> deleteCategoria(String id, Categoria categoria) async {
    final categoriaBox = await Hive.openBox<Categoria>('categorias');
    await categoriaBox.put(id, categoria);
  }

  Future<bool> categoriaExists(String name) async {
    final categoriaBox = await Hive.openBox<Categoria>('categorias');
    final categorias = categoriaBox.values;
    return categorias.any((categoria) => categoria.nombre == name);
  }

  Future<void> categoriaResetBox() async {
    final categoriaBox = await Hive.openBox<Categoria>('categorias');
    await categoriaBox.clear();
    print('Done');
    categoriaBox.close();
  }
}
