import 'package:hive/hive.dart';

part 'bmi_model.g.dart';


@HiveType(typeId: 0)
class BmiModel extends HiveObject {
  @HiveField(0)
  final double weight;

  @HiveField(1)
  final double height;

  @HiveField(2)
  final double bmi;

  @HiveField(3)
  final String menssage;

  @HiveField(4)
  DateTime data;

  BmiModel({
    required this.weight,
    required this.height,
    required this.bmi,
    required this.menssage,
    required this.data,
  });

  static Future<void> salvar(BmiModel bmi) async {
    final box = await Hive.openBox<BmiModel>('bmiBox');
    await box.add(bmi);
  }

  static Future<List<BmiModel>> listar() async {
    final box = await Hive.openBox<BmiModel>('bmiBox');
    return box.values.toList();
  }

  static Future<void> deletar(BmiModel bmi) async {
    await Hive.openBox<BmiModel>('bmiBox');
    await bmi.delete();
  }
}
