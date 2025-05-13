import 'package:flutter/material.dart';
import 'package:imc_dio_hive/presentation/addimc/viewmodel/add_imc_viewmodel.dart';

class AddImcPage extends StatefulWidget {
  const AddImcPage({super.key});

  @override
  _AddImcPageState createState() => _AddImcPageState();
}

class _AddImcPageState extends State<AddImcPage> {
  AddImcViewmodel imcViewmodel = AddImcViewmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar IMC'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Preencha os dados abaixo:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: imcViewmodel.weightController,
                    decoration: InputDecoration(
                      labelText: 'Peso (kg)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: const Icon(Icons.monitor_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: imcViewmodel.heightController,
                    decoration: InputDecoration(
                      labelText: 'Altura (m)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: const Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        imcViewmodel.salvarBmi();
                      });
                      imcViewmodel.clearBmi();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('IMC salvo com sucesso!')),
                      );
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Salvar IMC',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
