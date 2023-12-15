// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datas.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class dataAdapter extends TypeAdapter<data> {
  @override
  final int typeId = 0;

  @override
  data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return data(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, data obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is dataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
