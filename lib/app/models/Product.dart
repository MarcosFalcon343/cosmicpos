import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
part 'productos_adapter.g.dart';

@HiveType(typeId: 1)
class Producto {
  @HiveField(0)
  String id;
  @HiveField(1)
  String sku;
  @HiveField(2)
  String nombre;
  @HiveField(3)
  String precio;
  @HiveField(4)
  String costo;

  @HiveField(5)
  int? tipo;
  @HiveField(6)
  String? categoria;
  @HiveField(7)
  String? proveedor;
  @HiveField(8)
  int? estado;
  @HiveField(9)
  String? imagen;
  @HiveField(10)
  String? descripcion;

  Producto(
      {required this.id,
      required this.sku,
      required this.nombre,
      required this.precio,
      required this.costo,
      this.tipo = 1,
      this.estado = 1,
      this.categoria,
      this.proveedor,
      this.imagen = 'image-not.svg',
      this.descripcion}) {}
}
