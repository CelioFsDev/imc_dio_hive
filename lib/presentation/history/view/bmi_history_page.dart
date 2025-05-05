import 'package:flutter/material.dart';
import 'package:imc_dio_hive/data/models/imc_model.dart';

class BmiHistoryPage extends StatelessWidget {
  const BmiHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiList = BmiModel.listar(); // Obtém a lista de registros de BMI

    return Scaffold(
      appBar: AppBar(title: const Text('Historico de IMC'), centerTitle: true),
      body:
          bmiList.isEmpty
              ? const Center(
                child: Text(
                  'Não existem historicos de imc registrados.',
                  style: TextStyle(fontSize: 16.0),
                ),
              )
              : ListView.builder(
                itemCount: bmiList.length,
                itemBuilder: (context, index) {
                  final bmi = bmiList[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        'IMC: ${bmi.bmi.toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Messagem: ${bmi.menssage}\n'
                        'Peso: ${bmi.weight} kg | Altura: ${bmi.height} m',
                      ),
                      trailing: Text(
                        '${bmi.data.day}/${bmi.data.month}/${bmi.data.year}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
