import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../domain/controller/processo_seletivo_controller.dart';
import '../domain/providers/processo_seletivo_provider.dart';
import '../domain/repositories/processo_eletivo_repository.dart';

class ProcessoSeletivoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProcessoSeletivoController>(() => ProcessoSeletivoController(
        repository: ProcessoSeletivoRepository(
            provider: ProcessoSeletivoProvider(dio: Dio()))));
  }
}
