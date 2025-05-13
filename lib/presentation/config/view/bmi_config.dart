import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:imc_dio_hive/data/models/bmi_model.dart';

class BmiConfigPage extends StatelessWidget {
  const BmiConfigPage({super.key});

  Future<void> _clearBmiData(BuildContext context) async {
    final box = await Hive.openBox<BmiModel>('bmiBox');
    await box.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Todos os dados de IMC foram apagados.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Configurações do Aplicativo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text('Apagar todos os dados de IMC'),
              subtitle: const Text(
                'Remove todos os registros salvos no aplicativo.',
              ),
              onTap: () async {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: const Text('Confirmar'),
                        content: const Text(
                          'Tem certeza de que deseja apagar todos os dados?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text('Apagar'),
                          ),
                        ],
                      ),
                );

                if (confirm == true) {
                  await _clearBmiData(context);
                }
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.blue),
              title: const Text('Sobre o Aplicativo'),
              subtitle: const Text('Informações sobre o aplicativo de IMC.'),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'IMC App',
                  applicationVersion: '1.0.0',
                  applicationIcon: const Icon(Icons.fitness_center),
                  children: [
                    const Text(
                      'Este aplicativo foi desenvolvido para calcular e armazenar o Índice de Massa Corporal (IMC). '
                      'Ele utiliza o Hive para persistência de dados local.',
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
