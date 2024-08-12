import 'package:flutter/material.dart';

class PedidoStateC extends StatelessWidget {
  final Map<String, String> pedido;

  const PedidoStateC({super.key, required this.pedido});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estado del Pedido (Cliente)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pedido: ${pedido['nombre']}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Descripción: ${pedido['descripcion']}'),
            const SizedBox(height: 10),
            Text('Precio: ${pedido['precio']}'),
            const SizedBox(height: 10),
            Text('Estatus: ${pedido['estatus']}'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
