// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoriaAdapter extends TypeAdapter<Categoria> {
  @override
  final int typeId = 0;

  @override
  Categoria read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Categoria(
      nombre: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Categoria obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.nombre);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoriaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
