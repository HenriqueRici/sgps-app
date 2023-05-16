import 'package:get/get.dart';

import '../models/processo_seletivo.dart';
import '../repositories/processo_eletivo_repository.dart';

class ProcessoSeletivoController extends GetxController {
  ProcessoSeletivoRepository repository;

  ProcessoSeletivoController({required this.repository});

  late List<ProcessoSeletivo> _processoSeletivoList;
  List<ProcessoSeletivo> get seletivos => _processoSeletivoList;

  Future<void> fetchProcessoSeletivo() async {
    _processoSeletivoList = await repository.fetchProcessoSeletivo();
    update();
  }
}
