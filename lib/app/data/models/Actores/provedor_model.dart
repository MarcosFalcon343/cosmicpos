import 'package:cosmicpos/app/data/models/Actores/provedor.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProveedorModel {
  ProveedorModel();

  Future<void> addProvedor(Proveedor proveedor) async {
    final proveedorBox = await Hive.openBox<Proveedor>('provedores');
    await proveedorBox.add(proveedor);
  }

  Future<Proveedor?> getProveedor(int key) async {
    final proveedorBox = await Hive.openBox<Proveedor>('provedores');
    return proveedorBox.get(key);
  }

  Future<List<Proveedor>> getAllProveedores() async {
    final proveedorBox = await Hive.openBox<Proveedor>('provedores');
    final List<Proveedor> provedores = proveedorBox.values.toList();
    return provedores;
  }

  Future<void> updateProveedore(int key, Proveedor proveedor) async {
    final proveedorBox = await Hive.openBox<Proveedor>('provedores');
    await proveedorBox.put(key, proveedor);
  }

  Future<void> deleteProveedor(int key) async {
    final proveedorBox = await Hive.openBox<Proveedor>('provedores');
    await proveedorBox.delete(key);
  }

  // Future<bool> categoriaExists(String name) async {
  //   final proveedorBox = await Hive.openBox<Proveedor>('provedores');
  //   final proveedor = proveedorBox.values;
  //   return proveedor.any((categoria) => categoria.nombre == name);
  // }

  Future<void> proveedorResetBox() async {
    final proveedorBox = await Hive.openBox<Proveedor>('provedores');
    await proveedorBox.clear();
    proveedorBox.close();
  }
}
