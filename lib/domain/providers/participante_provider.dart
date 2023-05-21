import 'dart:convert';

import 'package:dio/dio.dart';
import '../models/participante.dart';

const api = 'http://localhost:8080/sgps';

class ParticipanteProvider {
  final Dio dio;

  ParticipanteProvider({required this.dio});

  Future<Response> createParticipante(Participante participante) async {
    final response = await dio.post('$api/participantes/primeira-inscricao',
        data: participante.toJson());
    return response;
    //fazer tratamento de exceção
  }

  Future<bool> checkCpf(String cpf) async {
    final response = await dio.get('$api/participantes/verifica-cpf/$cpf');
    Map<String, dynamic> status = jsonDecode(response.toString());
    return status['verificaCPF'];
  }

  Future<Response> createParticipanteCadastrado(int id, String cpf) async {
    final response =
        await dio.post('$api/participantes/inscricao', data: toJson(id, cpf));
    return response;
  }

  Map<String, dynamic> toJson(int id, String cpf) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cpf'] = cpf;
    data['idProcessoSeletivo'] = id;
    return data;
  }
}
