// ignore: file_names
import 'package:flutter/material.dart';
import 'package:loadpage/envio.dart';
import 'package:loadpage/produtos.dart';

// ignore: camel_case_types
class detalheCompra extends StatefulWidget {
  const detalheCompra({super.key});

  @override
  FormsState createState() => FormsState();
}

class FormsState extends State<detalheCompra> {
  final TextEditingController _selecionado = TextEditingController();
  final TextEditingController _preco = TextEditingController();
  final TextEditingController _quantidade = TextEditingController();

  Color textColor = Colors.black; // default color
  Color textColorWarning = Colors.grey; // default color
  Color borderColor = Colors.grey;

  bool envio = false;

  // simula envia de informação
  void _enviar() {
    String selecionado = _selecionado.text;
    String preco = _preco.text;
    String quantidade = _quantidade.text;
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
      if (selecionado == "" || preco == '' || quantidade == '') {
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
        title: const Text('Detalhes'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16.0),
            const Text('Detalhes da compra', style: TextStyle(fontSize: 25.0)),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _selecionado,
                decoration: InputDecoration(
                  hintText: 'Mostrar Selecionado',
                  prefixIcon: const Icon(Icons.analytics),
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
                controller: _preco,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Insira sua preco',
                  prefixIcon: const Icon(Icons.shop),
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
                controller: _quantidade,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Quantidade:',
                  prefixIcon: const Icon(Icons.shop),
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
            const Text('total da compra: 0',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const detalheCompra(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(100, 50),
              ),
              child: const Text('Calcular'),
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
                                  builder: (context) =>
                                      const ListagemProdutos(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(100, 20),
                            ),
                            child: const Text('Voltar'),
                          ),
                          const SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const envioProduto(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(100, 20),
                            ),
                            child: const Text('Enviar'),
                          ),
                        ]))
                : const SizedBox.shrink(),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
