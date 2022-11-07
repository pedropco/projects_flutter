import 'package:flutter/material.dart';
import 'main.dart';

class Resultado extends StatelessWidget {
  final int valor;
  final void Function() funcaoRetornar;

  const Resultado(this.valor, this.funcaoRetornar, {super.key});

  String get textoFinal {
    if (valor < 8) {
      return "fraco";
    } else if (valor < 17) {
      return 'melhorou';
    } else {
      return 'aí ficou top';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
              color: Colors.white,
              width: double.infinity,
              child: Text(
                textoFinal,
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              )),
        ),
        body: Container(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.black,
            ),
            onPressed: funcaoRetornar,
            child: Text("Recomeçar"),
          ),
        ),
      ),
    );
  }
}
