import 'package:imc_dio_hive/data/models/bmi_result_model.dart';

class CalculateBmiUsecase {
  BmiResult execute(double weight, double height) {
    final heightMeters = height < 3 ? height : height / 100;
    final bmi = weight / (heightMeters * heightMeters);

    String message;
    if (bmi < 18.5) {
      message = 'Abaixo do peso';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      message = 'Peso normal';
    } else if (bmi >= 25 && bmi < 29.9) {
      message = 'Sobrepeso';
    } else {
      message = 'Obesidade';
    }

    return BmiResult(bmi, message);
  }
}
