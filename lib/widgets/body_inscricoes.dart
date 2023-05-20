import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgps/domain/controller/participante_controller.dart';

import '../domain/models/participante.dart';

class BodyInscricoes extends GetView<ParticipanteController> {
  const BodyInscricoes({super.key});

  @override
  Widget build(BuildContext context) {
    // final String id = Get.arguments;
    return Container(
      color: Colors.blue,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            //controller.checkCpfByEdital('3', '06465533138');
            controller.create(Participante(
                nome: 'Joao',
                cpf: '64765640051',
                confirmacaoCpf: '64765640051',
                dataNascimento: '09/09/1999',
                dataIngresso: '02/02/2020',
                classe: 'C',
                nivel: 'N012',
                senha: 'a123',
                confirmacaoSenha: 'a123',
                idProcessoSeletivo: '1'));
          },
          child: const Text('Fazer Requisição'),
          // Text(
          //   'ID: $id',
          //   style: const TextStyle(fontSize: 100),
          // ),
        ),
      ),
    );
  }
}
