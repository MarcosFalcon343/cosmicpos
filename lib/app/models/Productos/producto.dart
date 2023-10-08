import 'package:cosmicpos/app/models/Actores/provedor.dart';
import 'package:cosmicpos/app/models/Productos/categoria.dart';

class Producto {
  final String id;
  final String sku;
  final String nombre;
  final int precio;
  final int costo;
  final String? estado;
  final String? tipo;
  final String? imagen;
  final String? descripcion;
  final Categoria? categoria;
  final Proveedor? proveedor;

  Producto(
      {required this.id,
      required this.sku,
      required this.nombre,
      required this.precio,
      required this.costo,
      this.estado = 'DISPONIBLE',
      this.tipo = 'PIEZA',
      this.imagen = 'NOT IMAGE',
      this.descripcion,
      this.categoria,
      this.proveedor});
}
