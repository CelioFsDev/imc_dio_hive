import 'package:flutter/material.dart';
import 'package:imc_dio_hive/presentation/addimc/view/add_imc_page.dart';
import 'package:imc_dio_hive/presentation/history/view/bmi_history_page.dart';

class DashboardHomePage extends StatelessWidget {
  const DashboardHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard IMC'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          children: [
            _buildDashboardCard(
              icon: Icons.calculate,
              label: 'Calcular IMC',
              color: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddImcPage()),
                );
              },
            ),
            _buildDashboardCard(
              icon: Icons.history,
              label: 'Histórico de IMC',
              color: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BmiHistoryPage(),
                  ),
                );
              },
            ),
            _buildDashboardCard(
              icon: Icons.info,
              label: 'Sobre o IMC',
              color: Colors.orange,
              onTap: () {
                // Navegar para informações sobre o IMC
              },
            ),
            _buildDashboardCard(
              icon: Icons.settings,
              label: 'Configurações',
              color: Colors.purple,
              onTap: () {
                // Navegar para configurações
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48.0, color: color),
            const SizedBox(height: 8.0),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
