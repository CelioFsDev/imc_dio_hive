import 'package:flutter/material.dart';
import 'package:imc_dio_hive/constants/app_strings.dart';
import 'package:imc_dio_hive/presentation/addimc/viewmodel/add_imc_viewmodel.dart';
import 'package:imc_dio_hive/widgets/custom_button.dart';
import 'package:imc_dio_hive/widgets/custom_text.dart';

class AddImcPage extends StatefulWidget {
  const AddImcPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddImcPageState createState() => _AddImcPageState();
}

class _AddImcPageState extends State<AddImcPage> {
  AddImcViewmodel imcViewmodel = AddImcViewmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: AppStrings.adicionarImc),
        centerTitle: true,
      ),
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
                  CustomButton(
                    text: 'Salvar IMC',
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
