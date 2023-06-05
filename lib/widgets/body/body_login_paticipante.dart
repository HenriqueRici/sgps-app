import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/controller/participante_controller.dart';

class BodyLoginParticipante extends GetView<ParticipanteController> {
  BodyLoginParticipante({super.key});
  final TextEditingController _login = TextEditingController();
  final TextEditingController _senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.40,
        width: MediaQuery.of(context).size.width * 0.30,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(
                  0, 3), // deslocamento horizontal e vertical da sombra
            ),
          ],
        ),
        child: Column(children: [_cabecalho(context), _body(context)]),
      ),
    ));
  }

  _cabecalho(BuildContext context) {
    return Container(
      height: 80,
      color: const Color.fromRGBO(33, 35, 37, 1),
      width: MediaQuery.of(context).size.width,
      child: const Center(
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }

  _body(BuildContext context) {
    return Column(children: [
      Material(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 36.0, bottom: 16.0, left: 32.0, right: 32.0),
          child: TextField(
            controller: _login,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Login (CPF)',
            ),
          ),
        ),
      ),
      Material(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 16.0, bottom: 16.0, left: 32.0, right: 32.0),
          child: TextField(
            controller: _senha,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Senha',
            ),
          ),
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
          padding: const EdgeInsets.only(top: 32.0, right: 32.0),
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.login,
              size: 25,
            ),
            label: const Text('Entrar', style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
              side: const BorderSide(
                width: 2.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              backgroundColor: const Color.fromARGB(255, 16, 94, 172),
            ),
          ),
        ),
      ]),
    ]);
  }
}
