import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(decoration: InputDecoration(labelText: 'Email')),
            SizedBox(height: 16),
            TextField(decoration: InputDecoration(labelText: 'Senha'), obscureText: true),
            SizedBox(height: 24),
            ElevatedButton(onPressed: () {}, child: Text('Entrar')),
            TextButton(onPressed: () {}, child: Text('Cadastrar-se')),
            TextButton(onPressed: () {}, child: Text('Esqueceu a senha?')),
          ],
        ),
      ),
    );
  }
}