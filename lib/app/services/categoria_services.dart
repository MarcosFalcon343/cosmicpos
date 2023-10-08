import 'package:cosmicpos/app/models/Productos/categoria.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductosServices {
  late Box categoriaBox;

  ProductosServices() {
    categoriaBox = _abrirCaja() as Box;
  }

  Future<Box> _abrirCaja() async {
    Hive.initFlutter();
    return await Hive.openBox('Productos');
  }

  Future<void> addCategory(Categoria categoria) async {
    await categoriaBox.put(categoria.id, categoria);
  }

  Future<Categoria?> getCategory(String id) async {
    return categoriaBox.get(id);
  }

  Future<List<Categoria>> getCategories() async {
    return categoriaBox.values.toList() as List<Categoria>;
  }

  Future<void> updateCategory(Categoria categoria) async {
    await categoriaBox.put(categoria.id, categoria);
  }

  Future<void> delateCategory(String id) async {
    await categoriaBox.delete(id);
  }

  Future<bool> existCategory(String id) async {
    return categoriaBox.containsKey(id);
  }
}
