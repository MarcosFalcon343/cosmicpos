import 'package:cosmicpos/app/data/models/Actores/cliente.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ClienteModel {
  ClienteModel();

  Future<void> addCliente(Cliente cliente) async {
    final clienteBox = await Hive.openBox<Cliente>('clientes');
    await clienteBox.add(cliente);
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

  Future<void> updateCliente(int key, Cliente cliente) async {
    final clienteBox = await Hive.openBox<Cliente>('clientes');
    await clienteBox.put(key, cliente);
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

  Future<void> clientesResetBox() async {
    final clienteBox = await Hive.openBox<Cliente>('clientes');
    await clienteBox.clear();
    clienteBox.close();
  }
}
