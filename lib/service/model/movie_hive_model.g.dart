// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieHiveAdapter extends TypeAdapter<MovieHive> {
  @override
  final int typeId = 0;

  @override
  MovieHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieHive(
      id: fields[0] as int,
      title: fields[1] as String,
      posterPath: fields[2] as String,
      backdropPath: fields[3] as String,
      overview: fields[4] as String,
      voteAverage: fields[5] as double,
      genre: fields[6] as String,
      releaseDate: fields[7] as DateTime,
      runtime: fields[8] as int,
      castList: (fields[9] as List).cast<Cast>(),
    );
  }

  @override
  void write(BinaryWriter writer, MovieHive obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.posterPath)
      ..writeByte(3)
      ..write(obj.backdropPath)
      ..writeByte(4)
      ..write(obj.overview)
      ..writeByte(5)
      ..write(obj.voteAverage)
      ..writeByte(6)
      ..write(obj.genre)
      ..writeByte(7)
      ..write(obj.releaseDate)
      ..writeByte(8)
      ..write(obj.runtime)
      ..writeByte(9)
      ..write(obj.castList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
