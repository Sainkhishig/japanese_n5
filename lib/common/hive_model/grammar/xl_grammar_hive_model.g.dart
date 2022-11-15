// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xl_grammar_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class XlGrammarHiveModelAdapter extends TypeAdapter<XlGrammarHiveModel> {
  @override
  final int typeId = 2;

  @override
  XlGrammarHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return XlGrammarHiveModel()
      ..level = fields[0] as int
      ..grammar = fields[1] as String
      ..formMn = fields[2] as String
      ..formEn = fields[3] as String
      ..meaningMn = fields[4] as String
      ..meaningEn = fields[5] as String
      ..example1 = fields[6] as String
      ..example2 = fields[7] as String
      ..example3 = fields[8] as String
      ..example4 = fields[9] as String
      ..example5 = fields[10] as String
      ..example1Mn = fields[11] as String
      ..example2Mn = fields[12] as String
      ..example3Mn = fields[13] as String
      ..example4Mn = fields[14] as String
      ..example5Mn = fields[15] as String
      ..example1En = fields[16] as String
      ..example2En = fields[17] as String
      ..example3En = fields[18] as String
      ..example4En = fields[19] as String
      ..example5En = fields[20] as String;
  }

  @override
  void write(BinaryWriter writer, XlGrammarHiveModel obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.level)
      ..writeByte(1)
      ..write(obj.grammar)
      ..writeByte(2)
      ..write(obj.formMn)
      ..writeByte(3)
      ..write(obj.formEn)
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
      ..write(obj.example4)
      ..writeByte(10)
      ..write(obj.example5)
      ..writeByte(11)
      ..write(obj.example1Mn)
      ..writeByte(12)
      ..write(obj.example2Mn)
      ..writeByte(13)
      ..write(obj.example3Mn)
      ..writeByte(14)
      ..write(obj.example4Mn)
      ..writeByte(15)
      ..write(obj.example5Mn)
      ..writeByte(16)
      ..write(obj.example1En)
      ..writeByte(17)
      ..write(obj.example2En)
      ..writeByte(18)
      ..write(obj.example3En)
      ..writeByte(19)
      ..write(obj.example4En)
      ..writeByte(20)
      ..write(obj.example5En);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is XlGrammarHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
