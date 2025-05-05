import 'package:flutter/material.dart';
import 'package:imc_dio_hive/data/models/imc_model.dart';

class AddImcViewmodel {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  double imcResult = 0.0;
  String menssage = '';

  void calculaImc() {
    final weight = double.tryParse(weightController.text);
    final height = double.tryParse(heightController.text);

    if (weight != null && height != null) {
      final heightInMeters = heightController.text.contains('.')
          ? height
          : height / 100;
      imcResult = weight / (heightInMeters * heightInMeters);

      if (imcResult < 18.5) {
        menssage = 'Abaixo do peso';
      } else if (imcResult >= 18.5 && imcResult < 24.9) {
        menssage = 'Peso normal';
      } else if (imcResult >= 25 && imcResult < 29.9) {
        menssage = 'Sobrepeso';
      } else {
        menssage = 'Obesidade';
      }
    } else {
      menssage = 'Preencha todos os campos!';
    }
  }

  void salvarImc() {
    final weight = double.tryParse(weightController.text);
    final height = double.tryParse(heightController.text);

    if (weight != null && height != null) {
      calculaImc();
      final newBmi = BmiModel(
        weight: weight,
        height: height,
        bmi: imcResult,
        menssage: menssage,
        data: DateTime.now(),
      );
      BmiModel.salvar(newBmi);
    }
  }

  void clearIMC() {
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