import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:imc_dio_hive/data/models/bmi_model.dart';

class BmiInfoPage extends StatelessWidget {
  const BmiInfoPage({super.key});

  Future<BmiModel?> _getLastBmi() async {
    final box = await Hive.openBox<BmiModel>('bmiBox');
    if (box.isNotEmpty) {
      return box.getAt(box.length - 1); // Obtém o último registro
    }
    return null;
  }

  Map<String, dynamic> _getBmiObservation(double bmi) {
    if (bmi < 18.5) {
      return {
        'message':
            'Você está abaixo do peso. Considere consultar um profissional de saúde.',
        'color': Colors.blue,
      };
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return {
        'message':
            'Seu peso está normal. Continue mantendo um estilo de vida saudável!',
        'color': Colors.green,
      };
    } else if (bmi >= 25 && bmi < 29.9) {
      return {
        'message':
            'Você está com sobrepeso. É importante cuidar da alimentação e praticar exercícios.',
        'color': Colors.orange,
      };
    } else {
      return {
        'message':
            'Você está na faixa de obesidade. Procure orientação de um profissional de saúde.',
        'color': Colors.red,
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Informações sobre o IMC')),
      body: FutureBuilder<BmiModel?>(
        future: _getLastBmi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar os dados.'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: Text('Nenhum registro de IMC encontrado.'),
            );
          } else {
            final bmi = snapshot.data!;
            final observationData = _getBmiObservation(bmi.bmi);
            final observationMessage = observationData['message'];
            final observationColor = observationData['color'];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Seu Último IMC',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Peso: ${bmi.weight.toStringAsFixed(1)} kg',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Altura: ${bmi.height.toStringAsFixed(2)} m',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'IMC: ${bmi.bmi.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Observação: $observationMessage',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: observationColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Categorias do IMC:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  _buildBmiCategory('Abaixo do peso', '< 18.5', Colors.blue),
                  _buildBmiCategory('Peso normal', '18.5 - 24.9', Colors.green),
                  _buildBmiCategory('Sobrepeso', '25 - 29.9', Colors.orange),
                  _buildBmiCategory('Obesidade', '>= 30', Colors.red),
                  const SizedBox(height: 16),
                  const Text(
                    'Importante:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'O IMC é uma ferramenta útil, mas não leva em consideração fatores como composição corporal, idade, sexo ou nível de atividade física. '
                    'Consulte um profissional de saúde para uma avaliação mais precisa.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildBmiCategory(String category, String range, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Text('$category: $range', style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
