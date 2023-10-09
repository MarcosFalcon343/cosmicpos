import 'package:hive_flutter/hive_flutter.dart';


part 'categoria.g.dart';

@HiveType(typeId: 0)
class Categoria extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String nombre;
  @HiveField(2)
  bool active;

  Categoria({required this.id, required this.nombre,this.active = true});

  @override
  String toString() {
    return 'Categoria{id: $id, nombre: $nombre}, active: $active';
  }

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(id: json['id'], nombre: json['nombre'],active: json['active']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'nombre': nombre, 'active': active};
  }
}
