import 'package:flutter/material.dart';

import '../layouts/clienteLayout/pedidoStateC.dart';
import 'pedidosController.dart';

class LoginController {
  static const List<Map<String, String>> users = [
    {'username': 'admin', 'password': 'admin123', 'role': 'admin'},
    {'username': 'cliente', 'password': 'cliente123', 'role': 'cliente'},
    {'username': 'repartidor', 'password': 'repartidor123', 'role': 'repartidor'},
  ];

  static void authenticateUser(String username, String password, BuildContext context) {
    final user = users.firstWhere(
      (user) => user['username'] == username && user['password'] == password,
      orElse: () => {},
    );

    if (user.isNotEmpty) {
      String role = user['role']!;
      if (role == 'admin' || role == 'repartidor') {
        PedidosController.showPedidosList(context, role); // Pasar el rol del usuario aquí
      } else if (role == 'cliente') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PedidoStateC(pedido: PedidosController.pedidos[0]),
          ),
        );
      }
    } else {
      // Mostrar un mensaje de error si el usuario no es encontrado
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario o contraseña incorrectos')),
      );
    }
  }
}
