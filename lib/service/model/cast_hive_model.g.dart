// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CastHiveAdapter extends TypeAdapter<CastHive> {
  @override
  final int typeId = 1;

  @override
  CastHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CastHive(
      name: fields[0] as String,
      character: fields[1] as String,
      profilePath: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CastHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.character)
      ..writeByte(2)
      ..write(obj.profilePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CastHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
