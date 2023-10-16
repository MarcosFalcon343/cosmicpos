import 'package:cosmicpos/app/data/models/Actores/cliente.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ClienteModel {
  ClienteModel();

  Future<void> addProvedor(Cliente proveedor) async {
    final clienteBox = await Hive.openBox<Cliente>('clientes');
    await clienteBox.add(proveedor);
  }

  Future<Cliente?> getCliente(int key) async {
    final clienteBox = await Hive.openBox<Cliente>('clientes');
    return clienteBox.get(key);
  }

  Future<List<Cliente>> getAllClientes() async {
    final clienteBox = await Hive.openBox<Cliente>('clientes');
    final List<Cliente> clientes = clienteBox.values.toList();
    return clientes;
  }

  Future<void> updateCliente(int key, Cliente proveedor) async {
    final clienteBox = await Hive.openBox<Cliente>('clientes');
    await clienteBox.put(key, proveedor);
  }

  Future<void> deleteCliente(int key) async {
    final clienteBox = await Hive.openBox<Cliente>('clientes');
    await clienteBox.delete(key);
  }

  // Future<bool> categoriaExists(String name) async {
  //   final proveedorBox = await Hive.openBox<Proveedor>('provedores');
  //   final proveedor = proveedorBox.values;
  //   return proveedor.any((categoria) => categoria.nombre == name);
  // }

  Future<void> clienterResetBox() async {
    final clienteBox = await Hive.openBox<Cliente>('clientes');
    await clienteBox.clear();
    clienteBox.close();
  }
}
