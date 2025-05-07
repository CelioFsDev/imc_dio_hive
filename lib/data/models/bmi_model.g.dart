// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bmi_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BmiModelAdapter extends TypeAdapter<BmiModel> {
  @override
  final int typeId = 0;

  @override
  BmiModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BmiModel(
      weight: fields[0] as double,
      height: fields[1] as double,
      bmi: fields[2] as double,
      menssage: fields[3] as String,
      data: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, BmiModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.weight)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.bmi)
      ..writeByte(3)
      ..write(obj.menssage)
      ..writeByte(4)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BmiModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
