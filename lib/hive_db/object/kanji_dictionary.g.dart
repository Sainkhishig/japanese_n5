// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kanji_dictionary.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KanjiDictionaryAdapter extends TypeAdapter<KanjiDictionary> {
  @override
  final int typeId = 1;

  @override
  KanjiDictionary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KanjiDictionary()
      ..level = fields[0] as int
      ..kanji = fields[1] as String
      ..translate = fields[2] as String
      ..onReading = fields[3] as String
      ..kunReading = fields[4] as String
      ..example = fields[5] as String
      ..exampleTr = fields[6] as String
      ..exampleReading = fields[7] as String;
  }

  @override
  void write(BinaryWriter writer, KanjiDictionary obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.level)
      ..writeByte(1)
      ..write(obj.kanji)
      ..writeByte(2)
      ..write(obj.translate)
      ..writeByte(3)
      ..write(obj.onReading)
      ..writeByte(4)
      ..write(obj.kunReading)
      ..writeByte(5)
      ..write(obj.example)
      ..writeByte(6)
      ..write(obj.exampleTr)
      ..writeByte(7)
      ..write(obj.exampleReading);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KanjiDictionaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
