import 'package:hive_flutter/hive_flutter.dart';

part 'provedor.g.dart';

@HiveType(typeId: 1)
class Proveedor {
  @HiveField(1)
  final String nombres;
  @HiveField(2)
  final String apellidoPaterno;
  @HiveField(3)
  final String? apellidoMaterno;
  @HiveField(4)
  final String nombreComercial;
  @HiveField(5)
  final String? telefono;
  @HiveField(6)
  final String? giroComercial;

  Proveedor(
      {required this.nombres,
      required this.apellidoPaterno,
      this.apellidoMaterno,
      required this.nombreComercial,
      this.telefono,
      this.giroComercial});

  @override
  String toString() {
    return 'Provedor{nombrecompleto: $nombres $apellidoPaterno $apellidoMaterno, nombreComercial: $nombreComercial}, telefono: $telefono, giroComercial $giroComercial';
  }
}
