import 'package:get/get.dart';
import 'package:sgps/domain/models/participante.dart';
import 'package:sgps/domain/repositories/participante_repository.dart';

class ParticipanteController extends GetxController {
  final _participante = ''.obs;
  ParticipanteRepository repository;

  ParticipanteController({required this.repository});

  String get response => _participante.value;

  Future<void> create(Participante participante) async {
    final response = await repository.createParticipante(participante);

    _participante.value = response.data.toString();
  }

  Future<bool> checkCpf(String cpf) async {
    final response = await repository.checkCpf(cpf);
    return response;
  }
}
