import 'package:cosmicpos/app/data/models/Actores/provedor.dart';
import 'package:cosmicpos/app/data/models/Actores/provedor_model.dart';

class ProveedorController {
  final ProveedorModel _model = ProveedorModel();
  ProveedorController();
  Future<List<Proveedor>> cargarProvedores() async {
    return await _model.getAllProveedores();
  }

  void agregarProveedor(Proveedor proveedor) {
    _model.addProvedor(proveedor);
  }

  void actualizarProveedor(int key, Proveedor proveedor) {
    _model.updateProveedore(key, proveedor);
  }

  void eliminarProveedor(int key) {
    _model.deleteProveedor(key);
  }
}
