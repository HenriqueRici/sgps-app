import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../domain/controller/processo_seletivo_controller.dart';
import '../domain/providers/processo_seletivo_provider.dart';
import 'domain/controller/participante_controller.dart';
import 'domain/providers/participante_provider.dart';
import 'domain/repositories/participante_repository.dart';
import 'domain/repositories/processo_seletivo_repository.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProcessoSeletivoController>(() => ProcessoSeletivoController(
        repository: ProcessoSeletivoRepository(
            provider: ProcessoSeletivoProvider(dio: Dio())),
        participanteRepository: ParticipanteRepository(
            provider: ParticipanteProvider(dio: Dio()))));

    Get.lazyPut<ParticipanteController>(() => ParticipanteController(
        repository: ParticipanteRepository(
            provider: ParticipanteProvider(dio: Dio()))));
  }
}
