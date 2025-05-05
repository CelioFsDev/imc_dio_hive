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
      appBar: AppBar(title: const Text('Adicionar IMC')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: imcViewmodel.weightController,
                decoration: const InputDecoration(labelText: 'Peso (kg)'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Altura (m)'),
                controller: imcViewmodel.heightController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  imcViewmodel.salvarImc();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('IMC salvo com sucesso!')),
                  );
                  imcViewmodel.clearIMC();
                  Navigator.pop(context);
                },
                child: const Text('Salvar IMC'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
