import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgps/domain/controller/participante_controller.dart';

class BodyInscricoes extends GetView<ParticipanteController> {
  BodyInscricoes({super.key});

  @override
  Widget build(BuildContext context) {
    //final String id = Get.arguments;
    return SizedBox(
      child: Flex(
        direction: Axis.vertical,
        children: [_bodyInscricoes(context)],
      ),
    );
  }

  Widget _bodyInscricoes(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _textFieldBuild(controller.nomeController, 'Nome:',
                      false), //requerir campo em todos
                ),
                Expanded(
                  child:
                      _textFieldBuild(controller.cpfController, 'CPF:', false),
                ),
              ],
            ),
            Row(children: [
              Expanded(
                child: _textFieldBuild(controller.dataNascimentoController,
                    'Data de Nascimento:', false), // calendario de seleção
              ),
              Expanded(
                child: _textFieldBuild(controller.dataIngressoController,
                    'Data de Ingresso:', false),
              ),
            ]),
            Row(
              children: [
                Expanded(
                  child: _textFieldBuild(controller.senhaController, 'Senha:',
                      true), // exibir senha
                ),
                Expanded(
                  child: _textFieldBuild(controller.confirmarSenhaController,
                      'Confimação de Senha:', true),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: _textFieldBuild(
                      controller.classeController, 'Classe:', false),
                ),
                Expanded(
                  child: _textFieldBuild(
                      controller.nivelController, 'Nivel:', false),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 32.0)),
            ElevatedButton(
              onPressed: () async {
                await controller.create(
                    controller.dadosParticipante(int.parse(Get.arguments)));
                controller.nomeController = TextEditingController();
                controller.cpfController = TextEditingController();
                controller.dataNascimentoController = TextEditingController();
                controller.dataIngressoController = TextEditingController();
                controller.senhaController = TextEditingController();
                controller.confirmarSenhaController = TextEditingController();
                controller.classeController = TextEditingController();
                controller.nivelController = TextEditingController();
                Get.toNamed('/');
              },
              child: const Text('Inscrever-se'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFieldBuild(
      TextEditingController controllerField, String label, bool senha) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 24.0, bottom: 16.0, left: 32.0, right: 32.0),
        child: TextField(
          controller: controllerField,
          obscureText: senha,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: label,
          ),
        ),
      ),
    );
  }
}
