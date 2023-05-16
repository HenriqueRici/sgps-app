import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Row(
        children: [_sidebar(context), _boryHome(context)],
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

  Widget _boryHome(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      color: const Color.fromARGB(255, 62, 65, 68),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          child: const Column(children: [
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
          ]),
        ),
        _listProcessoSeletivo(),
      ]),
    );
  }

  Widget _listProcessoSeletivo() {
    return Container();
  }
}
