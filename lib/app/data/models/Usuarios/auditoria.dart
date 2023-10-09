class Auditora {
  final String id;
  final String empleado; // Empledado que realizo una accion en un refistro
  final String
      tipoRegistro; //Que registro fue alterado(Proveedor, Producto, Categoria)
  final String accion; // Que accion realizo Crear, Modificar, Eliminar
  final DateTime fecha; //Cuando se realizo la alteracion
  final String idRegistro; //Id del registro que fue alterado;
  final String descripcion; //JSON del registro

  Auditora(
      {required this.id,
      required this.empleado,
      required this.tipoRegistro,
      required this.accion,
      required this.fecha,
      required this.idRegistro,
      required this.descripcion});
}
