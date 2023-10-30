import 'package:cosmicpos/app/data/models/Actores/provedor.dart';
import 'package:cosmicpos/app/data/models/Productos/categoria.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'producto.g.dart';

@HiveType(typeId: 3)
class Producto extends HiveObject {
  @HiveField(0)
  String sku;
  @HiveField(1)
  String nombre;
  @HiveField(2)
  double precio;
  @HiveField(3)
  double costo;
  @HiveField(4)
  String? estado;
  @HiveField(5)
  String? tipo;
  @HiveField(6)
  String? imagen;
  @HiveField(7)
  String? descripcion;
  @HiveField(8)
  Categoria categoria;
  @HiveField(9)
  Proveedor proveedor;

  Producto(
      {required this.sku,
      required this.nombre,
      required this.precio,
      required this.costo,
      this.estado = 'DISPONIBLE',
      this.tipo = 'PIEZA',
      this.imagen = 'NOT IMAGE',
      this.descripcion,
      required this.categoria,
      required this.proveedor});

  @override
  String toString() {
    return 'Producto(sku: $sku, nombre: $nombre, precio: $precio, costo: $costo, estado: $estado, tipo: $tipo, imagen: $imagen, descripcion: $descripcion, categoria: $categoria, proveedor: $proveedor)';
  }
}
