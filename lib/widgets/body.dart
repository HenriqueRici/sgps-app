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
      child: Container(
        color: const Color.fromARGB(255, 62, 65, 68),
        child: Row(
          children: [_sidebar(context), _bodyHome(context)],
        ),
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
            child: Obx(
                () => _buildListView(context, controller.seletivos$.toList())),
          ),
        ],
      ),
    );
  }

  _buildListView(BuildContext context, List<ProcessoSeletivo> seletivos) {
    final screenWidth = MediaQuery.of(context).size.width;
    const itemWidth = 400.0; // Largura desejada para cada item
    final crossAxisCount = (screenWidth / itemWidth).floor();

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 1,
          mainAxisExtent: 450,
        ),
        shrinkWrap: true,
        itemCount: seletivos.length,
        itemBuilder: ((context, index) {
          return Card(
            margin: const EdgeInsets.all(16.0),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 48.0,
                    child: Center(
                      child: Text(
                        'Informações do Edital',
                        style: TextStyle(
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
                          'Edital:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        trailing: Text(
                          '${seletivos[index].edital}',
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Text(
                          'Cargo:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        trailing: Text(
                          '${seletivos[index].cargo}',
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Periodo de Inscrições:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'De: ${seletivos[index].dataInicioInscricoes} Hs',
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  'Até: ${seletivos[index].dataFimInscricoes} Hs',
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                )
                              ]),
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Periodo de Retificações:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'De: ${seletivos[index].dataInicioRetificacao} Hs',
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                'Até: ${seletivos[index].dataFimRetificacao} Hs',
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      ListTile(
                        trailing: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                          label: const Text('Inscrever-se'),
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(
                              width: 2.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 16, 94, 172),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
