import 'package:hive_flutter/hive_flutter.dart';

part 'categoria.g.dart';

@HiveType(typeId: 0)
class Categoria extends HiveObject {
  @HiveField(1)
  String nombre;

  Categoria({required this.nombre});

  @override
  String toString() {
    return 'Categoria{nombre: $nombre}';
  }

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(nombre: json['nombre']);
  }

  Map<String, dynamic> toJson() {
    return {'nombre': nombre};
  }
}
