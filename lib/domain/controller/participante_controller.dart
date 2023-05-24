import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgps/domain/models/participante.dart';
import 'package:sgps/domain/repositories/participante_repository.dart';

class ParticipanteController extends GetxController {
  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController dataIngressoController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmarSenhaController = TextEditingController();
  TextEditingController classeController = TextEditingController();
  TextEditingController nivelController = TextEditingController();

  final _participante = ''.obs;
  ParticipanteRepository repository;

  ParticipanteController({required this.repository});

  String get response => _participante.value;

  @override
  void onInit() async {
    nomeController = TextEditingController();
    cpfController = TextEditingController();
    dataNascimentoController = TextEditingController();
    dataIngressoController = TextEditingController();
    senhaController = TextEditingController();
    confirmarSenhaController = TextEditingController();
    classeController = TextEditingController();
    nivelController = TextEditingController();
    super.onInit();
  }

  Participante dadosParticipante(int idSeletivo) {
    return Participante(
        nome: nomeController.text,
        cpf: cpfController.text,
        confirmacaoCpf: cpfController.text,
        dataNascimento: dataNascimentoController.text,
        dataIngresso: dataIngressoController.text,
        senha: senhaController.text,
        confirmacaoSenha: confirmarSenhaController.text,
        classe: classeController.text,
        nivel: nivelController.text,
        idProcessoSeletivo: idSeletivo);
  }

  Future<void> create(Participante participante) async {
    final response = await repository.createParticipante(participante);

    _participante.value = response.data.toString();
  }

  Future<bool> checkCpf(String cpf) async {
    final response = await repository.checkCpf(cpf);
    return response;
  }
}
