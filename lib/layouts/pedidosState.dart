import 'package:flutter/material.dart';
import '../controllers/pedidosController.dart';

class PedidoState extends StatefulWidget {
  final Map<String, String> pedido;

  const PedidoState({super.key, required this.pedido});

  @override
  _PedidoStateState createState() => _PedidoStateState();
}

class _PedidoStateState extends State<PedidoState> {
  late String _status;

  @override
  void initState() {
    super.initState();
    _status = widget.pedido['estatus']!;
  }

  void _updateStatus(String newStatus) {
    setState(() {
      _status = newStatus;
      PedidosController.updatePedidoStatus(widget.pedido['nombre']!, newStatus);
    });
  }

  List<Widget> _getButtons() {
    switch (_status.toLowerCase()) {
      case 'ordenado':
        return [
          ElevatedButton(onPressed: () => _updateStatus('Aceptado'), child: const Text('Aceptar')),
          ElevatedButton(onPressed: () => _updateStatus('Cancelado'), child: const Text('Cancelar')),
        ];
      case 'aceptado':
        return [
          ElevatedButton(onPressed: () => _updateStatus('Preparando'), child: const Text('Preparar')),
          ElevatedButton(onPressed: () => _updateStatus('Cancelado'), child: const Text('Cancelar')),
        ];
      case 'preparando':
        return [
          ElevatedButton(onPressed: () => _updateStatus('Enviado'), child: const Text('Enviado')),
          ElevatedButton(onPressed: () => _updateStatus('Cancelado'), child: const Text('Cancelar')),
        ];
      case 'enviado':
        return [
          ElevatedButton(onPressed: () => _updateStatus('Recibido'), child: const Text('Recibido')),
          ElevatedButton(onPressed: () => _updateStatus('Cancelado'), child: const Text('Cancelar')),
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estado del Pedido'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pedido: ${widget.pedido['nombre']}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Descripción: ${widget.pedido['descripcion']}'),
            const SizedBox(height: 10),
            Text('Precio: ${widget.pedido['precio']}'),
            const SizedBox(height: 10),
            Text('Estatus: $_status'),
            const SizedBox(height: 20),
            const Text('Cambiar estatus:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              children: _getButtons(),
            ),
          ],
        ),
      ),
    );
  }
}
