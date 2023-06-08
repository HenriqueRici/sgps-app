import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sgps/domain/controller/area_participante_controller.dart';

import '../../domain/models/participante.dart';
import '../../domain/option.dart';

class BodyParticipante extends GetView<AreaParticipanteController> {
  const BodyParticipante({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.onInit(),
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    _cabecalho(context, 'Acompanhamento de Inscrições'),
                    _seletivosInscrito(context, controller.participante$.value),
                    _cabecalho(context, 'Dados Pessoais'),
                    _bodyDadosParticipante(context),
                  ],
                ),
    );
  }

  Widget _cabecalho(BuildContext context, String label) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      color: const Color.fromARGB(255, 62, 65, 68),
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
          color: Colors.white,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  _seletivosInscrito(BuildContext context, Participante participante) {
    final screenWidth = MediaQuery.of(context).size.width;
    const itemWidth = 300.0;
    final crossAxisCount = (screenWidth / itemWidth).floor();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 1,
        mainAxisExtent: 200,
      ),
      shrinkWrap: true,
      itemCount: participante.inscricoes!.length,
      itemBuilder: (context, index) {
        return _card(context, index, participante);
      },
    );
  }

  Widget _card(BuildContext context, int index, Participante participante) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 48.0,
              child: Center(
                child: Text(
                  'Edital ${participante.inscricoes?[index].editalProcessoSeletivo}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                ListTile(
                  leading: const Text(
                    'Situação:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  trailing: Text(
                    '${participante.inscricoes?[index].situacaoInscricao}',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    // await _retificarEdital(context, index, seletivos);
                  },
                  icon: const Icon(
                    Icons.edit_outlined,
                    size: 35,
                  ),
                  label:
                      const Text('Retificar', style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                      width: 2.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    backgroundColor: Color.fromARGB(255, 224, 5, 5),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyDadosParticipante(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width * 0.5;
    const itemWidth = 300.0;
    final crossAxisCount = (screenWidth / itemWidth).floor();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 1,
        mainAxisExtent: 360,
      ),
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) {
        return _cardDados(context);
      },
    );
  }

  Widget _cardDados(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: const Text(
                'Nome:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              trailing: Text(
                '${controller.participante$.value.nome}',
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              leading: const Text(
                'CPF:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              trailing: Text(
                '${controller.participante$.value.cpf}',
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              leading: const Text(
                'Data Nascimento:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              trailing: Text(
                '${controller.participante$.value.dataNascimento}',
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              leading: const Text(
                'Data Ingresso:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              trailing: Text(
                '${controller.participante$.value.dataIngresso}',
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              leading: const Text(
                'Classe:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              trailing: Text(
                '${controller.participante$.value.classe}',
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              leading: const Text(
                'Nível:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              trailing: Text(
                '${controller.participante$.value.nivel}',
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFieldBuild(TextEditingController controllerField, String label,
      bool senha, bool data) {
    MaskTextInputFormatter dateFormatter =
        MaskTextInputFormatter(mask: '##/##/####');
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 24.0, bottom: 16.0, left: 32.0, right: 32.0),
        child: TextField(
          controller: controllerField,
          inputFormatters: data ? [dateFormatter] : null,
          enabled: true, //colocar flag
          obscureText: senha,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: label,
          ),
        ),
      ),
    );
  }

  Widget _dropdownButtonClasse() {
    return Padding(
      padding: const EdgeInsets.only(left: 100, right: 100),
      child: SizedBox(
        width: 150.0,
        child: Material(
          child: Obx(() {
            return DropdownButtonFormField<String>(
                value: controller.classeSelecionada.string,
                items: controller.classes.map((Option<String> e) {
                  return DropdownMenuItem<String>(
                    value: e.value,
                    child: Text(e.label),
                  );
                }).toList(),
                onChanged: (selectedValue) {
                  if (selectedValue != 'Selecione') {
                    controller.setSelectedValueClasse(selectedValue ?? '');
                  }
                });
          }),
        ),
      ),
    );
  }

  Widget _dropdownButtonNivel() {
    return Padding(
      padding: const EdgeInsets.only(left: 100, right: 100),
      child: SizedBox(
        width: 150.0,
        child: Material(
          child: Obx(() {
            return DropdownButtonFormField<String>(
                value: controller.nivelSelecionado.string,
                items: controller.niveis.map((Option<String> e) {
                  return DropdownMenuItem<String>(
                    value: e.value,
                    child: Text(e.label),
                  );
                }).toList(),
                onChanged: (selectedValue) {
                  if (selectedValue != 'Selecione') {
                    controller.setSelectedValueNivel(selectedValue ?? '');
                  }
                });
          }),
        ),
      ),
    );
  }
}
