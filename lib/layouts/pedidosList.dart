import 'package:flutter/material.dart';
import '../controllers/pedidosController.dart';

class PedidosList extends StatelessWidget {
  final List<Map<String, String>> pedidos;
  final String userRole;

  const PedidosList({
    Key? key,
    required this.pedidos,
    required this.userRole,
  }) : super(key: key);

  Icon _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'ordenado':
        return const Icon(Icons.local_grocery_store, color: Colors.white);
      case 'aceptado':
        return const Icon(Icons.inventory_outlined, color: Colors.white);
      case 'preparando':
        return const Icon(Icons.local_dining, color: Colors.white);
      case 'enviado':
        return const Icon(Icons.moped, color: Colors.white);
      case 'recibido':
        return const Icon(Icons.check, color: Colors.white);
      default:
        return const Icon(Icons.help, color: Colors.white); // Icono por defecto para estado desconocido
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'ordenado':
        return const Color(0xFFB99766);
      case 'aceptado':
        return const Color(0xFFCA9060);
      case 'preparando':
        return const Color(0xFF9F6A3F);
      case 'enviado':
        return const Color(0xFFA6754C);
      case 'recibido':
        return const Color(0xFF8CC896);
      default:
        return Colors.grey; // Color por defecto para estado desconocido
    }
  }

  @override
  Widget build(BuildContext context) {
    // Filtrar los pedidos según el rol del usuario
    final filteredPedidos = userRole == 'admin'
        ? pedidos
        : pedidos.where((pedido) =>
            pedido['estatus'] == 'enviado' || pedido['estatus'] == 'recibido'
          ).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Pedidos'),
      ),
      body: ListView.builder(
        itemCount: filteredPedidos.length,
        itemBuilder: (context, index) {
          final pedido = filteredPedidos[index];
          return Card(
            color: _getStatusColor(pedido['estatus']!),
            child: ListTile(
              leading: _getStatusIcon(pedido['estatus']!),
              title: Text('Pedido ${index + 1} - ${pedido['estatus']}',
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text('${pedido['nombre']} - ${pedido['descripcion']}',
                style: const TextStyle(color: Colors.white),
              ),
              trailing: Text(pedido['precio']!,
                style: const TextStyle(color: Colors.white),
              ),
              onTap: () {
                PedidosController.showPedidoState(context, pedido);
              },
            ),
          );
        },
      ),
    );
  }
}
