class BmiModel {
  final double weight;
  final double height;
  final double bmi;
  final String menssage;
  DateTime data;

  BmiModel({
    required this.weight,
    required this.height,
    required this.bmi,
    required this.menssage,
    required this.data,
  });

  static final List<BmiModel> _bmiList = [];

  static void salvar(BmiModel bmi) {
    _bmiList.add(bmi);
  }

  static List<BmiModel> listar() {
    return _bmiList;
  }

  static void deletar(BmiModel bmi) {
    _bmiList.remove(bmi);
  }
}
