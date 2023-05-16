import '../models/processo_seletivo.dart';
import '../providers/processo_seletivo_provider.dart';

class ProcessoSeletivoRepository {
  final ProcessoSeletivoProvider provider;

  ProcessoSeletivoRepository({required this.provider});

  Future<List<ProcessoSeletivo>> fetchProcessoSeletivo() async {
    return await provider.fetchProcessoSeletivo();
  }
}
