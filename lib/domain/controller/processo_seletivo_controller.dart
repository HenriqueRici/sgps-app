import 'package:get/get.dart';

import '../models/processo_seletivo.dart';
import '../repositories/processo_eletivo_repository.dart';

class ProcessoSeletivoController extends GetxController {
  final _seletivos$ = <ProcessoSeletivo>[].obs;
  ProcessoSeletivoRepository repository;

  ProcessoSeletivoController({required this.repository});

  RxList<ProcessoSeletivo> get seletivos$ => _seletivos$;

  @override
  void onInit() async {
    await _fetchProcessosSeletivo();
    super.onInit();
  }

  @override
  void onReady() async {
    await _fetchProcessosSeletivo();
    super.onReady();
  }

  Future<void> _fetchProcessosSeletivo() async {
    var processoSeletivoList = await repository.fetchProcessoSeletivo();
    _seletivos$.assignAll(processoSeletivoList);
  }
}
