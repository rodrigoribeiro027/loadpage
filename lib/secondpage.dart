
import 'package:flutter/material.dart';
import 'package:loadpage/components/listvue.dart';


class SecondPage extends StatelessWidget {
  final String title;  final String description;
  const SecondPage({Key? key, required this.title, required this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page'),),
      body: Align(alignment: Alignment.center,
        child: Column(mainAxisSize: MainAxisSize.min,
          children: [ 
            const SizedBox(height: 100.0),
            ElevatedButton( onPressed: () { 
              Navigator.push( context,
                  MaterialPageRoute(builder: (context) => const Formslist()),
              );
            },
              child: const Text('Próxima'),
            ),
            const SizedBox(height: 100.0),
            // display parametres received
            Text(title,style:  const TextStyle(fontSize: 24.0, color: Colors.red)),
            Text(description,style:  const TextStyle(fontSize: 24.0, color: Colors.red))
          ],
        ),
      ),
    );
  }
}