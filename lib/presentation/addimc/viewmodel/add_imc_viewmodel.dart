import 'package:flutter/material.dart';
import 'package:imc_dio_hive/data/domain/usecases/calculate_bmi_usecase.dart';
import 'package:imc_dio_hive/data/domain/usecases/save_bmi_usecase.dart';
import 'package:imc_dio_hive/data/models/imc_model.dart';

class AddImcViewmodel {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  double imcResult = 0.0;
  String menssage = '';

  void calculaBmi() {
    final weight = double.tryParse(weightController.text);
    final height = double.tryParse(heightController.text);

    if (weight != null && height != null) {
      final usecase = CalculateBmiUsecase();
      final result = usecase.execute(weight, height);
      imcResult = result.bmi;
      menssage = result.message;
    } else {
      menssage = 'Por favor, preencha os campos corretamente.';
    }
  }

  void salvarBmi() {
    final weight = double.tryParse(weightController.text);
    final height = double.tryParse(heightController.text);

    if (weight != null && height != null) {
      calculaBmi();
      final newBmi = BmiModel(
        weight: weight,
        height: height,
        bmi: imcResult,
        menssage: menssage,
        data: DateTime.now(),
      );
      final saveBmiUseCase = SaveBmiUseCase();
      saveBmiUseCase.call(newBmi);
    } else {
      menssage = 'Por favor, preencha os campos corretamente.';
    }
  }

  void clearBmi() {
    weightController.clear();
    heightController.clear();
    imcResult = 0.0;
    menssage = '';
  }

  void dispose() {
    weightController.dispose();
    heightController.dispose();
  }
}
