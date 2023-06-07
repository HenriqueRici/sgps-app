import 'package:get/get.dart';
import 'package:sgps/domain/models/participante.dart';
import 'package:sgps/domain/repositories/participante_repository.dart';

class AreaParticipanteController extends GetxController {
  ParticipanteRepository repository;

  AreaParticipanteController({required this.repository});

  final _participante$ = Participante().obs;

  Rx<Participante> get participante$ => _participante$;

  @override
  void onInit() async {
    await fetchParticipante(Get.arguments['login']);
    super.onInit();
  }

  Future<void> fetchParticipante(String cpf) async {
    var response = await repository.fetchParticipante(cpf);
    _participante$.value = response;
  }
}
