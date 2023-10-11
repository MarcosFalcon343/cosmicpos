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
      id: fields[0] as String,
      nombres: fields[1] as String,
      apellidoPaterno: fields[2] as String,
      apellidoMaterno: fields[3] as String,
      nombreComercial: fields[4] as String,
      telefono: fields[5] as String?,
      giroComercial: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Proveedor obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nombres)
      ..writeByte(2)
      ..write(obj.apellidoPaterno)
      ..writeByte(3)
      ..write(obj.apellidoMaterno)
      ..writeByte(4)
      ..write(obj.nombreComercial)
      ..writeByte(5)
      ..write(obj.telefono)
      ..writeByte(6)
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
