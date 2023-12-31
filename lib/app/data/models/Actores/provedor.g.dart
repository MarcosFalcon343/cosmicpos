// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provedor.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProveedorAdapter extends TypeAdapter<Proveedor> {
  @override
  final int typeId = 1;

  @override
  Proveedor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Proveedor(
      nombres: fields[0] as String,
      apellidoPaterno: fields[1] as String,
      apellidoMaterno: fields[2] as String?,
      nombreComercial: fields[3] as String,
      telefono: fields[4] as String,
      giroComercial: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Proveedor obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.nombres)
      ..writeByte(1)
      ..write(obj.apellidoPaterno)
      ..writeByte(2)
      ..write(obj.apellidoMaterno)
      ..writeByte(3)
      ..write(obj.nombreComercial)
      ..writeByte(4)
      ..write(obj.telefono)
      ..writeByte(5)
      ..write(obj.giroComercial);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProveedorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
