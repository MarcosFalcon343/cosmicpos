import 'package:cosmicpos/app/data/models/Actores/provedor.dart';
import 'package:cosmicpos/app/data/models/Productos/categoria.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'producto.g.dart';

@HiveType(typeId: 3)
class Producto extends HiveObject {
  @HiveField(0)
  final String sku;
  @HiveField(1)
  final String nombre;
  @HiveField(2)
  final int precio;
  @HiveField(3)
  final int costo;
  @HiveField(4)
  final String? estado;
  @HiveField(5)
  final String? tipo;
  @HiveField(6)
  final String? imagen;
  @HiveField(7)
  final String? descripcion;
  @HiveField(8)
  final Categoria? categoria;
  @HiveField(9)
  final Proveedor? proveedor;

  Producto(
      {required this.sku,
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
