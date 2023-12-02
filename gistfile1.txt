import 'package:flutter/material.dart';
import 'principal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multiformulario',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final TextEditingController txtLogin = TextEditingController();
  final TextEditingController txtPass = TextEditingController();

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    const color = Color.fromARGB(255, 25, 94, 28);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: Center(
              child: Image.asset(
                'assets/img/user.png',
                width: 100,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
              ),
              decoration: const InputDecoration(
                hintText: "Usuario",
              ),
              controller: txtLogin,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
              ),
              decoration: const InputDecoration(
                hintText: "Contraseña",
              ),
              controller: txtPass,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 6, 52, 7)),
              icon: const Icon(Icons.login),
              label: const Text("Registrar Usuario"),
              onPressed: () {
                // Validar las credenciales aquí
                String username = txtLogin.text;
                String password = txtPass.text;

                // Ejemplo de credenciales válidas (puedes cambiarlas según tus necesidades)
                String validUsername = "atayde";
                String validPassword = "francisco";

                if (username == validUsername && password == validPassword) {
                  // Credenciales válidas, navegar a la pantalla de bienvenida con usuario válido
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Bienvenida(usuarioValido: true, username: username),
                    ),
                  );
                } else {
                  // Credenciales no válidas, mostrar un mensaje de error
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Error de autenticación'),
                        content:
                            const Text('Usuario o contraseña incorrectos.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
