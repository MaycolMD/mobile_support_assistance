// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReportDBAdapter extends TypeAdapter<ReportDB> {
  @override
  final int typeId = 0;

  @override
  ReportDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReportDB(
      id: fields[0] as int,
      date: fields[1] as String,
      rating: fields[2] as int,
      status: fields[3] as String,
      endTime: fields[4] as String,
      startTime: fields[5] as String,
      clientID: fields[6] as int,
      description: fields[7] as String,
      supportID: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ReportDB obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.rating)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.endTime)
      ..writeByte(5)
      ..write(obj.startTime)
      ..writeByte(6)
      ..write(obj.clientID)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.supportID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReportDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
