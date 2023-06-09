import 'package:dio/dio.dart';

import '../models/processo_seletivo.dart';
import '../providers/processo_seletivo_provider.dart';

class ProcessoSeletivoRepository {
  final ProcessoSeletivoProvider provider;

  ProcessoSeletivoRepository({required this.provider});

  Future<List<ProcessoSeletivo>> fetchProcessoSeletivo() async {
    return await provider.fetchProcessoSeletivo();
  }

  Future<bool> checkCpfByEdital(int id, String cpf) async {
    return await provider.checkCpfByedital(id, cpf);
  }

  Future<ProcessoSeletivo> fetchProcessoSeletivoById(int id) async {
    return await provider.fetchProcessoSeletivoById(id);
  }

  Future<Response> createProcessoSeletivo(
      ProcessoSeletivo processoSeletivo) async {
    return await provider.createProcessoSeletivo(processoSeletivo);
  }

  Future<Response> updateProcessoSeletivo(
      ProcessoSeletivo processoSeletivo) async {
    return await provider.updateProcessoSeletivo(processoSeletivo);
  }
}
