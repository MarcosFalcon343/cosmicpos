// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClientesAdapter extends TypeAdapter<Cliente> {
  @override
  final int typeId = 2;

  @override
  Cliente read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cliente(
      nombres: fields[0] as String,
      apellidoPaterno: fields[1] as String,
      apellidoMaterno: fields[2] as String,
      telefono: fields[3] as String?,
      correo: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Cliente obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.nombres)
      ..writeByte(1)
      ..write(obj.apellidoPaterno)
      ..writeByte(2)
      ..write(obj.apellidoMaterno)
      ..writeByte(3)
      ..write(obj.telefono)
      ..writeByte(4)
      ..write(obj.correo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
