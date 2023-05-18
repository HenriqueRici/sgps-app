import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgps/components/base_layout.dart';

class InscricoesPage extends StatelessWidget {
  const InscricoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String id = Get.arguments;
    return Scaffold(
      body: BaseLayout(
        child: Container(
            color: Colors.blue,
            child: Center(
              child: Text(
                'ID: $id',
                style: const TextStyle(fontSize: 48),
              ),
            )),
      ),
    );
  }
}
