import 'package:hive_flutter/hive_flutter.dart';

part 'provedor.g.dart';

@HiveType(typeId: 1)
class Proveedor extends HiveObject {
  @HiveField(0)
  String nombres;
  @HiveField(1)
  String apellidoPaterno;
  @HiveField(2)
  String? apellidoMaterno;
  @HiveField(3)
  String nombreComercial;
  @HiveField(4)
  String telefono;
  @HiveField(5)
  String? giroComercial;

  Proveedor(
      {required this.nombres,
      required this.apellidoPaterno,
      this.apellidoMaterno,
      required this.nombreComercial,
      required this.telefono,
      this.giroComercial});

  @override
  String toString() {
    return 'Provedor{nombrecompleto: $nombres $apellidoPaterno $apellidoMaterno, nombreComercial: $nombreComercial}, telefono: $telefono, giroComercial $giroComercial';
  }
}
