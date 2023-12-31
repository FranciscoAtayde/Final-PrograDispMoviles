import 'package:flutter/material.dart';

class Bienvenida extends StatelessWidget {
  final bool usuarioValido;
  final String username;

  const Bienvenida(
      {super.key, required this.usuarioValido, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido!'),
        backgroundColor: Colors
            .redAccent, // Cambia el color de fondo de la barra de navegación
      ),
      body: Container(
        color: const Color.fromARGB(255, 207, 168,
            166), // Cambia el color de fondo de la pantalla de navegacion
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                usuarioValido ? Icons.check_circle : Icons.cancel,
                color: usuarioValido ? Colors.green : Colors.red,
                size: 100,
              ),
              const SizedBox(height: 20),
              Text(
                usuarioValido
                    ? '¡Bienvenido, $username!'
                    : 'Usuario no válido. Inténtalo de nuevo.',
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
