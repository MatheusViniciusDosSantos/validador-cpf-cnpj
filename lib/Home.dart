import 'package:flutter/material.dart';
import 'package:flutter_application_02_03/service/cpf.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  var campoCpf = TextEditingController();
  var campoCnpj = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Primeria Página')),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                  label: Text('CPF'), hintText: 'Informe o seu CPF'),
              controller: campoCpf,
            ),
            ElevatedButton(
              child: const Text('verificar'),
              onPressed: () {
                var resultado = validarCpf(campoCpf.text);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Aviso'),
                        content: Text(resultado),
                      );
                    });
              },
            ),
            const Padding(padding: EdgeInsets.all(5)),

            TextField(
              decoration: const InputDecoration(
                  label: Text('CNPJ'), hintText: 'Informe o seu CNPJ'),
              controller: campoCnpj,
            ),
            ElevatedButton(
              child: const Text('verificar'),
              onPressed: () {
                var resultado = validarCnpj(campoCnpj.text);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Aviso'),
                        content: Text(resultado),
                      );
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
