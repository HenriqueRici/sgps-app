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
    //if (response.statusCode == 200) {
    return model;
    //}
  }
}
