import 'package:flutter/material.dart';
import '../controllers/loginController.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.webp',
              height: 100, // Adjust the height as needed
              width: 100,  // Adjust the width as needed
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.5),
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  hintText: 'Usuario',
                  helperText: 'Ingresa tu usuario',
                  counterText: '0 characters',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.5),
              child: TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: 'Contraseña',
                  helperText: 'Ingresa tu contraseña',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                LoginController.authenticateUser(
                  _usernameController.text,
                  _passwordController.text,
                  context,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8CC896),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Iniciar Sesión', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}




