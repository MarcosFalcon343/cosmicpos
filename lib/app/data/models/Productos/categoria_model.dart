import 'package:cosmicpos/app/data/models/Productos/categoria.dart';
import 'package:hive/hive.dart';

class CategoriaModel {
  Future<void> addCategoria(String name) async {
    final categoriaBox = await Hive.openBox<Categoria>('categorias');
    Categoria categoria = Categoria(nombre: name);
    await categoriaBox.add(categoria);
  }

  Future<Categoria?> getCategoria(int key) async {
    final categoriaBox = await Hive.openBox<Categoria>('categorias');
    return categoriaBox.get(key);
  }

  Future<List<Categoria>> getAllCategorias() async {
    final categoriaBox = await Hive.openBox<Categoria>('categorias');
    final List<Categoria> categorias = categoriaBox.values.toList();
    return categorias;
  }

  Future<void> updateCategoria(int key, Categoria categoria) async {
    final categoriaBox = await Hive.openBox<Categoria>('categorias');
    await categoriaBox.put(key, categoria);
  }

  Future<void> deleteCategoria(int key) async {
    final categoriaBox = await Hive.openBox<Categoria>('categorias');
    await categoriaBox.delete(key);
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
