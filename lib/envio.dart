import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class envioProduto extends StatelessWidget {
  const envioProduto({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Envio Completo'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 30.0),
            Container(
                height: 300,
                width: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/envio.png'),  // Use the relative path here
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            const SizedBox(height: 16.0),
            const Text('Produto sendo Enviado com Sucesso!!',
                style: TextStyle(fontSize: 25.0)),
            const SizedBox(height: 10.0)
          ],
        ),
      ),
    );
  }
}