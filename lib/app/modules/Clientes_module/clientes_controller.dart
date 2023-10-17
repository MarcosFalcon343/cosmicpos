import 'package:cosmicpos/app/data/models/Actores/cliente.dart';
import 'package:cosmicpos/app/data/models/Actores/cliente_model.dart';

class ClientesController {
  ClienteModel modelo = ClienteModel();

  void agregarCliente(Cliente cliente) async {
    await modelo.addCliente(cliente);
  }

  Future<List<Cliente>> cargarClientes() async {
    return await modelo.getAllClientes();
  }

  void actualizarCliente(int key, Cliente cliente) async {
    await modelo.updateCliente(key, cliente);
  }

  void eliminarCliente(int key) async {
    await modelo.deleteCliente(key);
  }
}
