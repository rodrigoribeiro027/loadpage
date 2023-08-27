// ignore: file_names
import 'package:flutter/material.dart';

import '../SecondPage.dart';
import 'form.dart';

class FormsLogin extends StatefulWidget {
  const FormsLogin({super.key});

  @override
  FormsState createState() => FormsState();
}

class FormsState extends State<FormsLogin> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _senha = TextEditingController();

  Color textColor = Colors.black; // default color
  Color textColorWarning = Colors.grey; // default color
  Color borderColor = Colors.grey;

  bool envio = false;

  // simula envia de informação
  void _enviar() {
    String email = _email.text;
    String senha = _senha.text;

    // altera state textColor
    void changeTextColor(Color newColor) {
      setState(() {
        textColor = newColor;
      });
    }

    // altera cor da borda
    void changeBorderColor(Color newColor) {
      setState(() {
        borderColor = newColor;
      });
    }

    void changeEnvio(bool e) {
      setState(() {
        envio = e;
      });
    }

    // define resposta
    setState(() {
      // não informou nome
      if (email == "" || senha == '') {
        // altera cor do texto
        changeTextColor(Colors.red);
        // altera mensagem
        // alterar cor da borda
        changeBorderColor(Colors.red);
      } else {
        // ok, alterar dados para
        changeEnvio(true);
        changeTextColor(Colors.blue);
        changeBorderColor(Colors.grey);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Input'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 30.0),
            Container(
                height: 200,
                width: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/login.png'),  // Use the relative path here
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Entre com o email',
                  prefixIcon: const Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _senha,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Insira sua Senha',
                  prefixIcon: const Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            !envio
                ? SizedBox(
                    // botões
                    width: 300,
                    // Row determina que os widgets serão acrescentados
                    // lado a lado
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _enviar();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SecondPage(
                                    title: 'Item Title',
                                    description: 'Item description goes here',
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(100, 20), // Largura e altura desejadas
                              ),
                            child: const Text('Enviar'),
                          ),
                          const SizedBox(height: 16.0),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const Forms(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(100, 20), // Largura e altura desejadas
                              ),
                            child: const Text('Cadastro'),
                          ),]))
                : const SizedBox.shrink(),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
