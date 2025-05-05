import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(decoration: InputDecoration(labelText: 'Nome')),
            SizedBox(height: 16),
            TextField(decoration: InputDecoration(labelText: 'Email')),
            SizedBox(height: 16),
            TextField(decoration: InputDecoration(labelText: 'Senha'), obscureText: true),
            SizedBox(height: 16),
            TextField(decoration: InputDecoration(labelText: 'Confirmar Senha'), obscureText: true),
            SizedBox(height: 24),
            ElevatedButton(onPressed: () {}, child: Text('Cadastrar')),
          ],
        ),
      ),
    );
  }
}