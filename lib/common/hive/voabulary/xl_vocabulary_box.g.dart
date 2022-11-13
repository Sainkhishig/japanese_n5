// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xl_vocabulary_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class XlVocabularyBoxAdapter extends TypeAdapter<XlVocabularyBox> {
  @override
  final int typeId = 3;

  @override
  XlVocabularyBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return XlVocabularyBox()
      ..level = fields[0] as int
      ..kanji = fields[1] as String
      ..kana = fields[2] as String
      ..wordType = fields[3] as String
      ..meaningMn = fields[4] as String
      ..meaningEn = fields[5] as String
      ..example1 = fields[6] as String
      ..example2 = fields[7] as String
      ..example3 = fields[8] as String
      ..example1Mn = fields[9] as String
      ..example2Mn = fields[10] as String
      ..example3Mn = fields[11] as String
      ..example1En = fields[12] as String
      ..example2En = fields[13] as String
      ..example3En = fields[14] as String;
  }

  @override
  void write(BinaryWriter writer, XlVocabularyBox obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.level)
      ..writeByte(1)
      ..write(obj.kanji)
      ..writeByte(2)
      ..write(obj.kana)
      ..writeByte(3)
      ..write(obj.wordType)
      ..writeByte(4)
      ..write(obj.meaningMn)
      ..writeByte(5)
      ..write(obj.meaningEn)
      ..writeByte(6)
      ..write(obj.example1)
      ..writeByte(7)
      ..write(obj.example2)
      ..writeByte(8)
      ..write(obj.example3)
      ..writeByte(9)
      ..write(obj.example1Mn)
      ..writeByte(10)
      ..write(obj.example2Mn)
      ..writeByte(11)
      ..write(obj.example3Mn)
      ..writeByte(12)
      ..write(obj.example1En)
      ..writeByte(13)
      ..write(obj.example2En)
      ..writeByte(14)
      ..write(obj.example3En);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is XlVocabularyBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
