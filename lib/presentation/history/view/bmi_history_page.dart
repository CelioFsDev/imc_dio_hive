import 'package:flutter/material.dart';
import 'package:imc_dio_hive/constants/app_strings.dart';
import 'package:imc_dio_hive/data/models/bmi_model.dart';

class BmiHistoryPage extends StatefulWidget {
  const BmiHistoryPage({super.key});

  @override
  State<BmiHistoryPage> createState() => _BmiHistoryPageState();
}

class _BmiHistoryPageState extends State<BmiHistoryPage> {
  late Future<List<BmiModel>> _bmiListFuture;

  @override
  void initState() {
    super.initState();
    _bmiListFuture = BmiModel.listar();
  }

  Future<void> _deleteBmi(BmiModel bmi) async {
    await bmi.delete(); // Método para deletar o item no banco de dados
    setState(() {
      _bmiListFuture = BmiModel.listar(); // Atualiza a lista após a exclusão
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.historicoImc), centerTitle: true),
      body: FutureBuilder<List<BmiModel>>(
        future: _bmiListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Erro ao carregar os dados.',
                style: TextStyle(fontSize: 16.0),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'Não existem historicos de imc registrados.',
                style: TextStyle(fontSize: 16.0),
              ),
            );
          } else {
            final bmiList = snapshot.data!;
            return ListView.builder(
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
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${bmi.data.day}/${bmi.data.month}/${bmi.data.year}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            final confirm = await showDialog<bool>(
                              context: context,
                              builder:
                                  (context) => AlertDialog(
                                    title: const Text('Confirmar Exclusão'),
                                    content: const Text(
                                      'Tem certeza que deseja excluir este item?',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed:
                                            () => Navigator.of(
                                              context,
                                            ).pop(false),
                                        child: const Text('Cancelar'),
                                      ),
                                      TextButton(
                                        onPressed:
                                            () =>
                                                Navigator.of(context).pop(true),
                                        child: const Text('Excluir'),
                                      ),
                                    ],
                                  ),
                            );
                            if (confirm == true) {
                              await _deleteBmi(bmi);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
