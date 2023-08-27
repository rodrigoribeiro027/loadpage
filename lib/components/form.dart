
import 'package:flutter/material.dart';
import 'package:loadpage/components/formLogin.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  FormsState createState() => FormsState();
}

class FormsState extends State<Forms> {

  final TextEditingController _nome = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _senha = TextEditingController();
  
  Color textColor = Colors.black; // default color
  Color textColorWarning = Colors.grey; // default color
  Color borderColor = Colors.grey;

  bool envio = false;

  // simula envia de informação
  void _enviar() {
    String nome = _nome.text;
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
      if (nome == "" || email == "" || senha == "") {
        changeTextColor(Colors.red);
        changeBorderColor(Colors.red);
      } else {
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
        // barra do aplicativo
        title: const Text('Sample Input'),
      ),
      body: Align(
        // corpo do aplicativo
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 100.0), // um retângulo para separar widgets
            const Text(
              // label (texto)
              'Cadastro de Usuario',
              style: TextStyle(fontSize: 24.0, color: Colors.blue),
            ),
            const SizedBox(
                height: 16.0), // um retângulo contendo widget de entrada
            SizedBox(
                width: 300,
                child: TextField(
                  controller: _nome, 
                  keyboardType: TextInputType.text, 
                  decoration: InputDecoration(
                    // customização
                    hintText: 'Nome Completo',
                    prefixIcon:
                        const Icon(Icons.account_circle_outlined), //icon
                    enabledBorder: OutlineInputBorder(
                      //borda ao redor da entrada
                      borderSide: BorderSide(color: borderColor), //cor da borda
                    ), //quando receber o foco, altera cor da borda
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                )),
                const SizedBox(
                height: 10.0),
            SizedBox(
          width: 300,
          child: TextField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Email',
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
        const SizedBox(
                height: 10.0),
          SizedBox(
            width: 300,
            child: TextField(
              controller: _senha,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Digite uma senha',
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
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              _enviar();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FormsLogin(
                                  ),
                                ),
                              );
                            },
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(300, 20), // Largura e altura desejadas
                              ),
                            child: const Text('Enviar'),
                          ),
                      ],
                    ))
                : const SizedBox.shrink(),// espaço vazio
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
