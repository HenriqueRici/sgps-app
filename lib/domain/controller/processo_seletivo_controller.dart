import 'package:get/get.dart';
import 'package:sgps/domain/repositories/participante_repository.dart';

import '../models/processo_seletivo.dart';
import '../repositories/processo_seletivo_repository.dart';

class ProcessoSeletivoController extends GetxController {
  final _seletivos$ = <ProcessoSeletivo>[].obs;
  final _participante = ''.obs;
  ProcessoSeletivoRepository repository;
  ParticipanteRepository participanteRepository;

  ProcessoSeletivoController(
      {required this.repository, required this.participanteRepository});

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

  Future<bool> checkCpfByEdital(int id, String cpf) async {
    final response = await repository.checkCpfByEdital(id, cpf);
    return response;
  }

  Future<bool> checkCpf(String cpf) async {
    final response = await participanteRepository.checkCpf(cpf);
    return response;
  }

  Future<void> createParticipante(int id, String cpf) async {
    final response =
        await participanteRepository.createParticipanteCadastrado(id, cpf);
    _participante.value = response.data.toString();
  }
}
