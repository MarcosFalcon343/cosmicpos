import 'package:cosmicpos/app/data/models/Actores/contacto.dart';
import 'package:cosmicpos/app/data/models/Actores/direccion.dart';

class Proveedor {
  final String id;
  final String nombres;
  final String apellidoPaterno;
  final String apellidoMaterno;
  final String nombreComercial;
  final String? giroComercial;
  final Contacto? contacto;
  final Direccion? direccion;

  Proveedor(
      {required this.id,
      required this.nombres,
      required this.apellidoPaterno,
      required this.apellidoMaterno,
      required this.nombreComercial,
      this.giroComercial,
      this.contacto,
      this.direccion});
}
