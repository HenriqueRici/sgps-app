import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgps/domain/controller/area_participante_controller.dart';

class BodyParticipante extends GetView<AreaParticipanteController> {
  const BodyParticipante({super.key});

  @override
  Widget build(BuildContext context) {
    print(controller.participante$.value.cpf);
    return ListView(
      children: [
        Column(
          children: [
            _cabecalho(context, 'Seletivo(s) Inscrito'),
            ElevatedButton(
                onPressed: () {
                  print(controller.participante$.value.cpf);
                },
                child: const Text('clique'))
            //_seletivosInscrito(context, controller.)
          ],
        ),
      ],
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

  // _seletivosInscrito(BuildContext context, Participante participante) async {
  //   final screenWidth = MediaQuery.of(context).size.width;
  //   const itemWidth = 300.0;
  //   final crossAxisCount = (screenWidth / itemWidth).floor();
  //   return GridView.builder(
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: crossAxisCount,
  //       mainAxisSpacing: 1,
  //       crossAxisSpacing: 1,
  //       childAspectRatio: 1,
  //       mainAxisExtent: 200,
  //     ),
  //     shrinkWrap: true,
  //     itemCount: controller.fetchParticipante(cpf).i,
  //     itemCount: controller.seletivos$.toList().length,
  //     itemBuilder: (context, index) {
  //       return _card);
  //     },
  //   );
  // }

  // Widget _card(
  //     BuildContext context, int index) {
  //   return Card(
  //     margin: const EdgeInsets.all(16.0),
  //     elevation: 8,
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Column(
  //         children: [
  //           const SizedBox(
  //             height: 48.0,
  //             child: Center(
  //               child: Text(
  //                 'Edital Publicado',
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 18,
  //                 ),
  //               ),
  //             ),
  //           ),
  //           Column(
  //             children: [
  //               ListTile(
  //                 leading: const Text(
  //                   'Edital:',
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 16,
  //                   ),
  //                 ),
  //                 trailing: Text(
  //                   '${seletivos[index].edital}',
  //                   style: const TextStyle(
  //                     color: Colors.black,
  //                   ),
  //                 ),
  //               ),
  //               ElevatedButton.icon(
  //                 onPressed: () async {
  //                   await _retificarEdital(context, index, seletivos);
  //                 },
  //                 icon: const Icon(
  //                   Icons.edit_outlined,
  //                   size: 35,
  //                 ),
  //                 label:
  //                     const Text('Retificar', style: TextStyle(fontSize: 18)),
  //                 style: ElevatedButton.styleFrom(
  //                   side: const BorderSide(
  //                     width: 2.0,
  //                     color: Color.fromARGB(255, 0, 0, 0),
  //                   ),
  //                   backgroundColor: const Color.fromARGB(255, 212, 90, 8),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
