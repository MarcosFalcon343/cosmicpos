// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductoAdapter extends TypeAdapter<Producto> {
  @override
  final int typeId = 3;

  @override
  Producto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Producto(
      sku: fields[0] as String,
      nombre: fields[1] as String,
      precio: fields[2] as double,
      costo: fields[3] as double,
      estado: fields[4] as String?,
      tipo: fields[5] as String?,
      imagen: fields[6] as String?,
      descripcion: fields[7] as String?,
      categoria: fields[8] as Categoria,
      proveedor: fields[9] as Proveedor,
    );
  }

  @override
  void write(BinaryWriter writer, Producto obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.sku)
      ..writeByte(1)
      ..write(obj.nombre)
      ..writeByte(2)
      ..write(obj.precio)
      ..writeByte(3)
      ..write(obj.costo)
      ..writeByte(4)
      ..write(obj.estado)
      ..writeByte(5)
      ..write(obj.tipo)
      ..writeByte(6)
      ..write(obj.imagen)
      ..writeByte(7)
      ..write(obj.descripcion)
      ..writeByte(8)
      ..write(obj.categoria)
      ..writeByte(9)
      ..write(obj.proveedor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
