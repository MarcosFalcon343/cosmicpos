import 'package:hive_flutter/hive_flutter.dart';

part 'cliente.g.dart';

@HiveType(typeId: 2)
class Cliente extends HiveObject {
  @HiveField(0)
  String nombres;
  @HiveField(1)
  String apellidoPaterno;
  @HiveField(2)
  String apellidoMaterno;
  @HiveField(3)
  String? telefono;
  @HiveField(4)
  String? correo;

  Cliente(
      {required this.nombres,
      required this.apellidoPaterno,
      required this.apellidoMaterno,
      this.telefono,
      this.correo});
}
