import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgps/domain/controller/processo_seletivo_controller.dart';
import 'package:sgps/domain/models/processo_seletivo.dart';

class Body extends GetView<ProcessoSeletivoController> {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Row(
        children: [_sidebar(context), _bodyHome(context)],
      ),
    );
  }

  Widget _sidebar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
      color: const Color.fromRGBO(33, 35, 37, 1),
      child: Column(children: [
        _buildButton(context, "Início", Icons.home),
        _buildButton(context, "Área do Participante", Icons.person),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: _buildButton(
                context, 'Adiministrador', Icons.admin_panel_settings),
          ),
        )
      ]),
    );
  }

  Widget _buildButton(BuildContext context, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(icon),
          label: Text(label),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, double.infinity),
            side: const BorderSide(width: 2.0, color: Colors.white),
            backgroundColor: const Color.fromRGBO(33, 35, 37, 1),
          ),
        ),
      ),
    );
  }

  Widget _bodyHome(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width * 0.85,
            color: const Color.fromARGB(255, 62, 65, 68),
            padding: const EdgeInsets.all(8.0),
            child: const Column(
              children: [
                Text(
                  'Processo(s) Seletivo(s)',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: Colors.white),
                ),
                Text(
                  'Abaixo estão listados os editais disponíveis',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: Obx(() => _buildListView(controller.seletivos$.toList())),
          )
        ],
      ),
    );
  }

  _buildListView(List<ProcessoSeletivo> seletivos) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: seletivos.length,
      separatorBuilder: (BuildContext context, index) => const Divider(),
      itemBuilder: (context, index) {
        return ListTileTheme(
          dense: true,
          child: ExpansionTile(
            title: Text('Edital: ${seletivos[index].edital}'),
            subtitle: Text('Cargo: ${seletivos[index].cargo}'),
            children: [
              _tile(
                'Inicio das Inscrições: ${seletivos[index].dataInicioInscricoes} Hs',
                'Fim das Inscrições: ${seletivos[index].dataFimInscricoes} Hs',
              ),
              _tile(
                'Inicio das Retificações: ${seletivos[index].dataInicioRetificacao} Hs',
                'Fim das Retificações: ${seletivos[index].dataFimRetificacao} Hs',
              ),
            ],
          ),
        );
      },
    );
  }

  _tile(String label1, String label2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTileTheme(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 48.0),
              child: Text(label1),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 248.0),
              child: Text(label2),
            ),
          ],
        ),
      ),
    );
  }
}
