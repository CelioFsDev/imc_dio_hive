import 'package:imc_dio_hive/data/models/imc_model.dart';

class SaveBmiUseCase {
  void call(BmiModel bmi) {
    BmiModel.salvar(bmi);
  }
}
