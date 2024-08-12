import 'package:flutter/material.dart';
import '../layouts/pedidosList.dart';
import '../layouts/clienteLayout/pedidoStateC.dart';

class PedidosController {
  static List<Map<String, String>> pedidos = [
    // Tus datos de ejemplo
  ];

  static void showPedidosList(BuildContext context, String userRole) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PedidosList(
          pedidos: pedidos,
          userRole: userRole, // Asegúrate de pasar el rol del usuario
        ),
      ),
    );
  }

  static void showPedidoState(BuildContext context, Map<String, String> pedido) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PedidoStateC(pedido: pedido)),
    );
  }

  static void updatePedidoStatus(String nombre, String nuevoEstatus) {
    for (var pedido in pedidos) {
      if (pedido['nombre'] == nombre) {
        pedido['estatus'] = nuevoEstatus;
        break;
      }
    }
  }
}
