import 'package:flutter/material.dart';
import '../../controllers/pedidosController.dart';

class PedidoStateR extends StatefulWidget {
  final Map<String, String> pedido;

  const PedidoStateR({super.key, required this.pedido});

  @override
  _PedidoStateRState createState() => _PedidoStateRState();
}

class _PedidoStateRState extends State<PedidoStateR> {
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

  void _showCancelDialog() {
    TextEditingController cancelController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cancelar Pedido'),
          content: TextField(
            controller: cancelController,
            decoration: const InputDecoration(hintText: 'Motivo de la cancelación'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
                // Aquí puedes manejar el motivo de la cancelación si es necesario.
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estado del Pedido (Repartidor)'),
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
              children: [
                ElevatedButton(onPressed: () => _updateStatus('Recibido'), child: const Text('Recibido')),
                ElevatedButton(onPressed: _showCancelDialog, child: const Text('Cancelar')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
