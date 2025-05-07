import 'package:imc_dio_hive/data/models/bmi_model.dart';

class SaveBmiUseCase {
  void call(BmiModel bmi) {
    BmiModel.salvar(bmi);
  }
}
