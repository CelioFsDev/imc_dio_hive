import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:imc_dio_hive/data/models/bmi_model.dart';
import 'package:imc_dio_hive/presentation/dashboard/view/dashboard_home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BmiModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: DashboardHomePage(),
    );
  }
}
