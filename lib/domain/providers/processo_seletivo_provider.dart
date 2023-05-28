import 'dart:convert';

import 'package:dio/dio.dart';
import '../models/processo_seletivo.dart';

const api = 'http://localhost:8080/sgps';

class ProcessoSeletivoProvider {
  final Dio dio;

  ProcessoSeletivoProvider({required this.dio});

  Future<List<ProcessoSeletivo>> fetchProcessoSeletivo() async {
    final response = await dio.get('$api/processo-seletivo');
    final model = response.data
        .map<ProcessoSeletivo>((data) => ProcessoSeletivo.fromJson(data))
        .toList();
    return model;
    //fazer tratamento de exceção
  }

  Future<bool> checkCpfByedital(int id, String cpf) async {
    final response =
        await dio.get('$api/processo-seletivo/$id/verifica-cpf/$cpf');
    Map<String, dynamic> status = jsonDecode(response.toString());
    return status['verificaCPFByEdital'];
  }

  Future<ProcessoSeletivo> fetchProcessoSeletivoById(int id) async {
    final response = await dio.get('$api/processo-seletivo/$id');
    final model = response.data
        .map<ProcessoSeletivo>((data) => ProcessoSeletivo.fromJson(data));
    return model;
  }
}
